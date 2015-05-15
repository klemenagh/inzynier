%% Program do generacji obrazkow _syn.png - profile po synchronizacji
%  Dodana detekcja osi
clear;
clc
close all
addpath('funkcje')
save_img = 0; % 0 | 1
%% �cie�ka do bazy danych, u mnie jest to:

plik='M120620_152013.lvm';
sciezka_plik= plik; 
%% Load
profil=fun_load(sciezka_plik);
fprintf('Zaladowano dane. Ilosc probek: %d\n', numel(profil.t));

fprintf('Usuwanie offsetu.\n');
profil=fun_rm_offset(profil);

fprintf('Synchronizacja.\n');
syn=fun_synchronizacja(profil);
syn=fun_okno(syn);
rysunek_rej(syn, plik);
%% detekcja osi
[liczba_osi, syg]=fun_algorytm2_test(syn); %%%
zgodnosc=fun_test_zgodnosci(syg, liczba_osi);
rysunek_dr(syg, sciezka_plik);