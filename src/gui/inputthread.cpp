#include "inputthread.h"

void InputThread::loop() {
    while(this->work) {
        if(DEBUG) std::cout <<"try get data" << std::endl;
        QString type;
        unsigned axles;
        bool is5up = false;

        double positions[7];

        char source[100];
        std::string line;

        std::getline (std::cin, line);
        QString s(line.c_str());
        if(DEBUG) std::cout << s.toStdString() << std::endl;
        QTextStream str(&s);
        str >> source >> type;
        if(type == "5up") {
            is5up = true;
            axles = 5;
        }
        else axles = type.toInt();
        for(unsigned i = 0; i < axles + 2; i++) {
            str >> positions[i];
        }
        //wylicz położenia osi
        double axle_pos[axles];
        axle_pos[0] = positions[1];
        for(unsigned i = 1; i < axles; i++) {
            axle_pos[i] = axle_pos[i - 1] + positions[i + 1];
        }

        if(DEBUG) {
            std::cout << "length: " << positions[0] << std::endl;
            std::cout << "axles:  " << axles << std::endl;
            for(unsigned i = 0; i < axles; i++) {
                std::cout << "axle:   " << axle_pos[i] << std::endl;
            }
        }
        if(axles < 2 || axles > 5 || positions[0] == 0) {
            std::this_thread::sleep_for(std::chrono::milliseconds(100));
            continue; //nieobsługiwane przypadki
        }
        this->vehicles.push_back(Vehicle(positions[0], axles, axle_pos, is5up));

    }
}
