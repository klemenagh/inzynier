//
// Created by vka on 26.04.15.
//

#include <stdio.h>
#include <stdlib.h>
#include <errno.h>
#include <math.h>
#include "algorithm.h"

#include "kiss_fft/kiss_fft.h"

extern int verbosity_level;

vehicle_data_t algorithm2(data_vector_t *vector, bool verify,
                          bool check_lengths) {

    const unsigned OFFSET_NUM = 50;

    remove_offset(vector, OFFSET_NUM);

    //wyliczenie ilości próbek do obcięcia dla każdej pary czujników
    double velocity = 0; // prędkość w m/s
    double distance = 0; // odległość w m

    find_velocity_distance(vector, &velocity, &distance);

    trim_data(vector, velocity);

    trim_to_window(vector, 30);
    if (is_verbosity_at_least(DEBUG)) {
        printf(" Długość okna: %d\n", vector->trim_back);
    }

    //właściwa część algorytmu
    if (is_verbosity_at_least(DEBUG)) {
        puts("\nUruchamianie algorytmu poszukiwania osi.");
    }
    const unsigned length = vector->trim_back;
    double R[length], X[length];    // tablice sygnałów R01 i X01
    double M[length];               // sygnal M = R^2 + X^2
    double Kp[length];              // sygnal K' = a_b * R + X
    double Kp_max = 0;                  // wartość maksymalna sygnału K'
    double Ku[length];              // sygnał K' unormowany
    unsigned Lx, Lm;                // wartości liczników dla sygnałów X oraz M.
    unsigned num_axles;             // ilość osi
    unsigned axle_locations[5];     // zmienna pomocnicza, przechowująca numery próbek z przybliżonymi położeniami osi
    //nastawy algorytmu
    //w porównaniu do matlaba, a_b = r, Y = S, H = H
    double a_b, Y, H;
    vehicle_data_t vehicle;
    vehicle.velocity = velocity;

    data_cell_t *n = vector->head;
    for (unsigned i = 0; i < length; i++) {
        R[i] = n->data[DATA_R01];
        X[i] = n->data[DATA_X01];
        n = n->next;

        M[i] = pow(R[i], 2) + pow(X[i], 2);
    }

    Lx = count_compare(X, length, 0.1); //todo matlab=0.1, praca=0.2 ?
    Lm = count_compare(M, length, 0.5);

    if (Lm == 0) {
        if (is_verbosity_at_least(DEBUG)) {
            puts(" Liczba próbek sygnału Lm = 0.");
            // można przyjąć, że stosunek Lx/Lm = 0 i kontynuować pracę
        }
//        return INVALID; // 0 probek spełniających warunek!
    }

    if (1.0 * Lx > 0.1 * Lm) { //wybor nastaw zestawu A
        a_b = 0.21;
        Y = 0.8;
        H = 0.45;
    }
    else { //nastawy zestawu B
        a_b = 0.5;
        Y = 4;
        H = 0.5;
    }

    //stworzenie sygnalu K'
    for (unsigned i = 0; i < length; i++) {
        Kp[i] = a_b * R[i] + X[i];

        if (i == 0 || Kp[i] > Kp_max) Kp_max = Kp[i];
    }

    if (Kp_max > 3) {
        //zgodnie z implementacja w matlab, zmiana wartości nastaw na podane
        Y = 0.8;
        H = 0.45;
    }

    //normalizacja sygnału K'
    for (unsigned i = 0; i < length; i++) {
        Ku[i] = 5 * Kp[i] / Kp_max;
    }

    num_axles = counter(Ku, length, Y, H, axle_locations);
    //procedura szukania drugiej osi
    if (num_axles < 2) {
        if (is_verbosity_at_least(DEBUG)) {
            printf(" Znaleziono %1d osi, procedura szukania do 2...\n",
                   num_axles);
        }

        H = 0.1;
        while (num_axles < 2 && Y > 0.15) {
            Y -= 0.1;
            num_axles = counter(Ku, length, Y, H, axle_locations);
        }
    }
    vehicle.class = (vehicle_class) num_axles;

    //procedura szukania podniesionej piątej osi
    if (num_axles == 4) {
        if (is_verbosity_at_least(DEBUG)) {
            puts(" Znaleziono 4 osie, procedura szukania 5...");
        }
        H = 0.1;
        a_b = 0.3; //zwiększenie znaczenia sygnału R

        //przepisanie sygnału K' i Ku
        for (unsigned i = 0; i < length; i++) {
            Kp[i] = a_b * R[i] + X[i];
            if (i == 0 || Kp[i] > Kp_max) Kp_max = Kp[i];
        }
        for (unsigned i = 0; i < length; i++) {
            Ku[i] = 5 * Kp[i] / Kp_max;
        }
        unsigned axle_loc_tmp[5];
        //wlasciwe poszukiwanie 5. osi
        while (num_axles != 5 && Y > 0.15) {
            Y -= 0.1;
            num_axles = counter(Ku, length, Y, H, axle_loc_tmp);

            if (num_axles != 4 && num_axles != 5) {
                if (is_verbosity_at_least(DEBUG)) {
                    puts(" Przerwanie procedury szukania piątej osi.");
                }

                Y = 1.8;
                num_axles = counter(Ku, length, Y, H, axle_loc_tmp);

                break;
            }
        }

        if (num_axles == 5) {//znaleziono podniesiona os
            vehicle.class = POJAZD_5OS_UP;

            for (unsigned i = 0; i < 5; i++)
                axle_locations[i] = axle_loc_tmp[i];
        }
    }

    if (is_verbosity_at_least(DEBUG)) {
        printf(" Lm      = %5d\n Lx      = %5d\n", Lm, Lx);
        printf(" a_b [r] =  %4.2f\n", a_b);
        printf(" Y   [S] =  %4.2f\n", Y);
        printf(" H       =  %4.2f\n", H);
        printf(" Kp_max  = %5.2f\n", Kp_max);
        printf(" Osie    = %5d\n", num_axles);
    }

    if (verify) {
        // weryfikacja danych z piezo
        // w celu wywołania algorytmu wystarczy stworzyć tablicę z sygnałem z piezo
        // i wywołać licznik

        if (is_verbosity_at_least(DEBUG)) {
            puts(" Uruchamianie weryfikacji piezo.");
        }
        unsigned piezo_axles = 0;
        double P1[length];

        n = vector->head;
        for (unsigned i = 0; i < length; i++) {
            P1[i] = n->data[DATA_P1];
            n = n->next;
        }

        piezo_axles = counter(P1, length, 2, 0.1, NULL);

        if (is_verbosity_at_least(DEBUG)) {
            printf("  Pierwsza faza testu piezo zakończona.\n  osie = %d\n",
                   piezo_axles);
        }

        if (num_axles == piezo_axles) {
            //druga faza weryfikacji

            //symulacja pracy komparatora dla sygnalu Ku
            //0 - stan niski, 5 - stan wysoki
            //sygnał CP to złożenie sygnału C z powyzszego komparatora
            //oraz sygnału P z piezo1
            double CP[length];
            double is_high = 5; //5 = true, 0 = false
            const double level_top = Y + H / 2;
            const double level_bottom = Y - H / 2;

            for (unsigned i = 0; i < length; i++) {
                if (is_high == 0 && Ku[i] >= level_top) {
                    is_high = 5;
                }
                else if (is_high == 5 && Ku[i] < level_bottom) {
                    is_high = 0;
                }
                CP[i] = is_high + P1[i];
            }

            //ostatni etap weryfikacji, licznik impulsów dla sygnału CP
            // licznik - próg = 8, histereza = 0
            piezo_axles = counter(CP, length, 8, 0, NULL);


            if (is_verbosity_at_least(DEBUG)) {
                printf("  Druga faza testu piezo zakończona.\n  osie = %d\n",
                       piezo_axles);
            }
        }
        vehicle.piezo = piezo_axles;
    }

    if (check_lengths) {
        double dt =
                vector->head->next->data[DATA_T] - vector->head->data[DATA_T];
        find_lengths(M, length, dt, axle_locations, &vehicle);
    }

    return vehicle;
}

void remove_offset(data_vector_t *vector, unsigned num) {
    if (num == 0) {
        fputs("Ilość próbek do usuwania offsetu musi być większa od 0!\n",
              stderr);
        exit(EINVAL);
    }

    if (num > vector->length) {
        fputs("Ilość próbek do usuwania offsetu musi być mniejsza od długości wektora!\n",
              stderr);
        exit(EINVAL);
    }

    /*
     * deklaracja tablicy zawierającej offsety dla poszczególnych wektorów
     */
    double offsets[12] = {0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0};

    data_cell_t *n = vector->head;
    for (unsigned i = 0; i < num; i++) {
        for (unsigned j = 1; j < 13; j++) {
            offsets[j - 1] += n->data[j];
        }
        n = n->next;
    }

    //wyznaczenie ostatenczej wartości offsetu dla każdego wektora
    for (int i = 0; i < 12; i++) offsets[i] /= num;

    //przesunięcie wszystkich wartości w wektorze o zadany offset
    n = vector->head;
    for (unsigned i = 0; i < vector->length; i++) {
        for (unsigned j = 1; j < 13; j++) {
            n->data[j] -= offsets[j - 1];
        }
        n = n->next;
    }

    if (is_verbosity_at_least(DEBUG)) {
        printf(" Usuwanie offsetu z danych. Wartości offsetu dla poszczególnych parametrów:\n");
        for (int i = 0; i < 12; i++) printf("  offset = %10.6f\n", offsets[i]);
    }
}

void find_velocity_distance(data_vector_t *vector, double *v, double *d) {
    /*
     * Funkcja wykorzystuje wartości z czujników P1 i P2 wektora danych,
     * a także wektor czasu.
     * parametry v i d odpowiadają za wskaźniki do pamięci, gdzie
     * należy wpisać parametry ruchu
     *
     * Prędkość wyznaczana jest w jednostce m/s.
    */

    /*
     * Definiowanie parametrów
     */

    //zdefiniowanie progów histerezy [V]
    double p1, p2;
    p1 = 3;
    p2 = 2;

    //odległośc pomiędzy czujnikami
    double dist = 1;

    //zmienne
    bool is_impulse1 = false;
    bool is_impulse2 = false;

    unsigned num_impulse1 = 0;
    unsigned num_impulse2 = 0;

    //parametry wykorzystywane do wyliczenia odległości i prędkości
    int index1[2] = {0, 0};
    int index2[2] = {0, 0};

    data_cell_t *n = vector->head;
    for (unsigned i = 0; i < vector->length; i++) {

        //piezo 1
        if (n->data[DATA_P1] >= p1 && is_impulse1 == false) {
            is_impulse1 = true;
            num_impulse1 += 1;
            if (num_impulse1 <= 2) index1[num_impulse1 - 1] = i;
        }
        else if (n->data[DATA_P1] < p2 && is_impulse1 == true) {
            is_impulse1 = false;
        }

        //piezo2
        if (n->data[DATA_P2] >= p1 && is_impulse2 == false) {
            is_impulse2 = true;
            num_impulse2 += 1;
            if (num_impulse2 <= 2) index2[num_impulse2 - 1] = i;
        }
        else if (n->data[DATA_P2] < p2 && is_impulse2 == true) {
            is_impulse2 = false;
        }
        n = n->next;
    }

    double t1 = 0; //czas do wyznaczania prędkości
    double t2 = 0; //czas do wyznaczania odległości

    t1 = (index2[0] - index1[0] + index2[1] - index1[1]) / 2.0;
    t2 = (index1[1] - index1[0] + index2[1] - index2[0]) / 2.0;

    //konwersja na s
    double dt = vector->head->next->data[DATA_T] - vector->head->data[DATA_T];
    t1 *= dt;
    t2 *= dt;

    *v = dist / t1;
    *d = (*v) * t2;

    if (is_verbosity_at_least(DEBUG)) {
        printf(" Wyznaczanie prędkości i odległości:\n");
        printf("  Wartości indeksów:\n");
        printf("  Indeks 1: %5d %5d\n", index1[0], index1[1]);
        printf("  Indeks 2: %5d %5d\n", index2[0], index2[1]);
        printf("  Prędkość:  %8.4f m/s\n", *v);
        printf("  Odległość: %8.4f m\n", *d);
    }
}

void trim_data(data_vector_t *vector, double velocity) {

    double sensor_distance; // odległość dla każdej pary czujników
    unsigned trim_front; // ilość próbek do obcięcia z przodu
    unsigned trim_back;     // ilość próbek do obcięcia na końcu
    const double dt = vector->head->next->data[DATA_T]   // różnica czasów
                      - vector->head->data[DATA_T];     // między próbkami

    //ograniczenie z tylu
    trim_back = (unsigned) (25.0 / velocity / dt);
    vector->trim_back = trim_back;

    // 1m
    sensor_distance = 1;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[0] = trim_front;
    trim_values(vector, DATA_R1, trim_front, trim_back);
    trim_values(vector, DATA_X1, trim_front, trim_back);

    //0.5m
    sensor_distance += 1 + 0.5;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[1] = trim_front;
    trim_values(vector, DATA_R05, trim_front, trim_back);
    trim_values(vector, DATA_X05, trim_front, trim_back);

    //0.3m
    sensor_distance += 1 + 0.3;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[2] = trim_front;
    trim_values(vector, DATA_R03, trim_front, trim_back);
    trim_values(vector, DATA_X03, trim_front, trim_back);

    //3m
    sensor_distance += 1 + 1.5 + 0.1;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[3] = trim_front;
    trim_values(vector, DATA_R3, trim_front, trim_back);
    trim_values(vector, DATA_X3, trim_front, trim_back);

    //0.1m
    sensor_distance += 1.5 + 1 + 1.5;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[4] = trim_front;
    trim_values(vector, DATA_R01, trim_front, trim_back);
    trim_values(vector, DATA_X01, trim_front, trim_back);

    //piezo 1
    sensor_distance += 1 + 1.5 + 1.1 + 1 + 1;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[5] = trim_front;
    trim_values(vector, DATA_P1, trim_front, trim_back);

    //piezo 2
    sensor_distance += 1;
    trim_front = (unsigned) (sensor_distance / velocity / dt);
    vector->trim_front[6] = trim_front;
    trim_values(vector, DATA_P2, trim_front, trim_back);


    if (is_verbosity_at_least(DEBUG)) {
        printf(" Ilość próbek do obcięcia z przodu dla każdej pary czujników:\n");
        for (int i = 0; i < 7; i++)
            printf("  przód#%d %5d\n", i, vector->trim_front[i]);
        printf("  tył     %5d\n", vector->trim_back);
    }
}

void trim_values(data_vector_t *vector, data_field_t field, unsigned trim_front,
                 unsigned trim_back) {

    //todo ?
    trim_front--;
    trim_back++;

    data_cell_t *old, *new;

    old = vector->head;
    new = old;
    unsigned i = 0;
    for (i = 0; i < trim_front; i++) new = new->next;
    for (i = 0; i <= trim_back; i++) {
        old->data[field] = new->data[field];
        old = old->next;
        new = new->next;

        if (new == NULL) break; //osiagnieto koniec wektora
    }

    //jeśli osiągnięto koniec wektora zbyt wcześnie, wypełnij brakujące elemety
    // wartościami 0
    for (; i < trim_back && old != NULL; i++) {
        old->data[field] = 0;
        old = old->next;
    }

    for (; old != NULL; old = old->next) {
        old->data[field] = 0;
    }
}

void trim_to_window(data_vector_t *vector, unsigned ftt_stripe) {

    unsigned nfft;
    for (nfft = 2; nfft < vector->trim_back; nfft *= 2);

    if (is_verbosity_at_least(DEBUG)) printf(" Wartość nfft to %5d\n", nfft);

    //fft
    size_t buflen = sizeof(kiss_fft_cpx) * nfft;

    kiss_fft_cpx *signal = (kiss_fft_cpx *) malloc(buflen);
    kiss_fft_cpx *fft = (kiss_fft_cpx *) malloc(buflen);
    kiss_fft_cpx *reverse = (kiss_fft_cpx *) malloc(buflen);

    data_cell_t *n = vector->head;
    for (unsigned i = 0; i < vector->trim_back; i++) {
        signal[i].r = (float) (10 * sqrt(pow(n->data[DATA_R3], 2) +
                                         pow(n->data[DATA_X3], 2)));
        signal[i].i = 0;
        n = n->next;
    }
    for (unsigned i = vector->trim_back; i < nfft; i++) {
        signal[i].r = 0;
        signal[i].i = 0;
    }

//    for(unsigned i = 0; i < nfft; i++) printf("%f %f\n", re[i], im[i]);

    kiss_fft_cfg cfg = kiss_fft_alloc(nfft, 0, 0, 0);
    kiss_fft(cfg, signal, fft);
    free(cfg);

    cfg = kiss_fft_alloc(nfft, 1, 0, 0);

    for (unsigned i = ftt_stripe; i < nfft; i++) {
        fft[i].r = 0;
        fft[i].i = 0;
    }
    kiss_fft(cfg, fft, reverse);

    if (is_verbosity_at_least(ALL)) {
        for (unsigned i = 0; i < ftt_stripe + 2; i++)
            printf("%15.7f %15.7f\n", signal[i].r, signal[i].i);
        putchar('\n');
        for (unsigned i = 0; i < ftt_stripe + 2; i++)
            printf("%15.7f %15.7f\n", fft[i].r, fft[i].i);
        putchar('\n');
        for (unsigned i = 0; i < ftt_stripe + 2; i++)
            printf("%15.7f %15.7f\n", reverse[i].r, reverse[i].i);
    }
    /*
     * w przypadku użycia biblioteki kissfft, konieczne jest podzielenie
     * wartości próbek przez ich ilość, by uzyskać wyniki zgodne z funkcją
     * ifft matlaba.
     */

    double sig_out[vector->trim_back];
    for (unsigned i = 0; i < vector->trim_back; i++) {
        sig_out[i] = 2.0 * reverse[i].r / nfft;
    }

    //oproznanie zasobow wykorzystywanych przy wyliczaniu fft
    free(cfg);
    free(signal);
    free(fft);
    free(reverse);

    if (is_verbosity_at_least(ALL)) {
        putchar('\n');
        for (unsigned i = 0; i < ftt_stripe + 2; i++)
            printf("%15.7f\n", sig_out[i]);
    }

    //usuniecie offsetu z uzyskanego sygnalu na podstawie wartosci OFFSET_NUM
    const unsigned OFFSET_NUM = 50;
    double offset = 0;

    for (unsigned i = 0; i < OFFSET_NUM; i++) {
        offset += sig_out[i];
    }
    offset /= OFFSET_NUM;

    if (is_verbosity_at_least(DEBUG)) {
        printf(" Usuwanie offsetu z danych po fft.\n  offset = %10.6f\n",
               offset);
    }

    for (unsigned i = 0; i < vector->trim_back; i++) sig_out[i] -= offset;

    if (is_verbosity_at_least(ALL)) {
        printf(" Sygnał po usunięciu offsetu:\n");
        for (unsigned i = 0; i < ftt_stripe + 2; i++)
            printf("%15.7f\n", sig_out[i]);
    }

    /*
     * Wyszukiwanie okna w sygnale sig_out.
     */
    unsigned w_start = 0;
    unsigned w_end = vector->trim_back - 1;
    bool in_window = false;

    for (unsigned i = 0; i < vector->trim_back; i++) {
        if (sig_out[i] > 0.8 && in_window == false) {
            in_window = true;
            w_start = i;
        }
        else if (sig_out[i] < 0.5 && in_window == true) {
            w_end = i;
            break;
        }
    }

    if (is_verbosity_at_least(DEBUG)) {
        printf(" Ograniczanie sygnału do okna.\n  start = %5d\n  end   = %5d\n",
               w_start, w_end);
    }

    //ograniczanie sygnałów do znajdujących się w oknie
    for (int i = 0; i < 13; i++) { //dla każdej składowej wektora
        trim_values(vector, (data_field_t) i, w_start + 1, w_end - w_start);
    }
    vector->trim_back = w_end - w_start + 1;
    //usun offset czasu, by probka zaczynała się od t = 0
    double time_offset = vector->head->data[DATA_T];
    for (data_cell_t *m = vector->head; m != NULL; m = m->next) {
        m->data[DATA_T] -= time_offset;
    }
}

unsigned count_compare(double *array, unsigned len, double threshold) {
    if (array == NULL) {
        exit(EINVAL);
    }

    unsigned count = 0;
    for (unsigned i = 0; i < len; i++) {
        if (array[i] > threshold) count++;
    }

    return count;
}

unsigned counter(double *Ku, unsigned len, double Y, double H,
                 unsigned *axle_positions) {
    if (Ku == NULL) {
        exit(EINVAL);
    }

    unsigned num_axles = 0;
    unsigned is_high = 0; // flaga stanu [0 = stan niski, 1 = wysoki]

    const double level_top = Y + H / 2;
    const double level_bottom = Y - H / 2;

    double val_max = 0;

    for (unsigned i = 0; i < len; i++) {
        if (is_high == 0 && Ku[i] >= level_top) {
            is_high = 1;
            num_axles++;
        }
        else if (is_high == 1 && Ku[i] < level_bottom) {
            is_high = 0;
            val_max = 0;
        }

        if (axle_positions != NULL) {
            //if (val_max < Ku[i]) ;
            /*else*/ if (is_high && val_max < Ku[i]) {
                axle_positions[num_axles - 1] = i;
                val_max = Ku[i];
            }
        }
    }

    return num_axles;
}

void find_lengths(double *M, unsigned length, double dt,
                  unsigned axle_locations[5],
                  vehicle_data_t *vehicle) {
    /*
     * wektor M zawiera length próbek sygnału R_01^2 + X_01^2
     * dt opisuje ilość czasu pomiędzy dwoma kolejnymi próbkami
     */

    if (vehicle->class == INVALID) {
        if (is_verbosity_at_least(DEBUG)) {
            puts(" Nie udało się odnaleźć poprawnej ilości osi pojazdu, algorytm wyznaczania długości kończy działanie.\n");
        }
        return;
    }

    const unsigned num_axles =
            (vehicle->class == POJAZD_5OS_UP) ? 5 : (unsigned) vehicle->class;

    const double K_level = (num_axles > 2) ? 0.05 : 0.1; //poziom odcięcia
    const double l_front = 0.3, l_back = 0; //stałe do odjęcia od profilu
    //zmienne opisujące początek i koniec pojazdu
    unsigned index_start = 0;
    unsigned index_end = length - 1;

    if (is_verbosity_at_least(DEBUG)) {
        puts(" Procedura wykrywania położenia osi i długości pojazdu.");
        printf("  Liczba osi: %d\n", num_axles);
        for (unsigned i = 0; i < num_axles; i++) {
            printf("  Położenie osi %d: %d\n", i, axle_locations[i]);
        }
        printf("  Prędkość pojazdu: %.2f[m/s]\n", vehicle->velocity);
        printf("  dt: %f\n", dt);
    }

    for (unsigned i = 0; i < length; i++) {
        if (M[i] > K_level) {
            index_start = i;
            break;
        }
    }
    for (unsigned i = length - 1; i > 0; i--) {
        if (M[i] > K_level) {
            index_end = i;
            break;
        }
    }

    if (index_end < axle_locations[num_axles - 1]) {
        index_end = axle_locations[num_axles - 1];

        if (is_verbosity_at_least(DEBUG)) {
            printf("  Wykryto indeks końca pojazdu mniejszy od indeksu położenia"
                           " ostatniej osi. Dane wejściowe są zbyt nieczytelne, "
                           "by ustalić dokładne wartości długości.\n");
        }
    }
    if (is_verbosity_at_least(DEBUG)) {
        printf("  Początek pojazdu: %d, koniec pojazdu: %d\n", index_start,
               index_end);
    }

    //przejście w dziedzinę czasu
    vehicle->lengths[0] = (index_end - index_start)/* * dt * vehicle.velocity*/;

    if (is_verbosity_at_least(DEBUG)) {
        printf("  Długość pojazdu:  %.0f\n", vehicle->lengths[0]);
    }

    unsigned current_index = index_start;
    for (unsigned i = 0; i < num_axles; i++) {
        vehicle->lengths[i + 1] = axle_locations[i] - current_index;
        current_index = axle_locations[i];
    }
    vehicle->lengths[num_axles + 1] = index_end - axle_locations[num_axles - 1];

    if (is_verbosity_at_least(DEBUG)) {
        printf(" Wartości odległości\n");
        for (unsigned i = 0; i <= num_axles + 1; i++) {
            printf("  s%d = %.0f\n", i, vehicle->lengths[i]);
        }
    }
    for (unsigned i = 0; i <= num_axles + 1; i++) {
        vehicle->lengths[i] *= dt * vehicle->velocity;
    }

    //odjęcie stałych od długości przodu i tyłu pojazdu
    if (vehicle->lengths[1] > l_front) {
        vehicle->lengths[0] -= l_front;
        vehicle->lengths[1] -= l_front;
    }
    if (vehicle->lengths[num_axles + 1] > l_back) {
        vehicle->lengths[0] -= l_back;
        vehicle->lengths[num_axles + 1] -= l_back;
    }

    //zerowanie pozostałych pól
    for (unsigned i = num_axles + 2; i < 7; i++) vehicle->lengths[i] = 0;

    if (is_verbosity_at_least(DEBUG)) {
        printf(" Wartości odległości\n");
        for (unsigned i = 0; i <= num_axles + 1; i++) {
            printf("  s%d = %.3f\n", i, vehicle->lengths[i]);
        }
    }
}
