clear; close all; clc;
% Transmitancja G(s) = k / ((T1s + 1)(T2s + 1))
% Stałe:
k = 2;
T1 = 2;
T2 = 4;

obiekt_inercyjny = tf(k, [T1*T2, T1+T2, 1]);

% Charakterystyka skokowa.
figure(1);
step(obiekt_inercyjny);
grid on;

% Charakterystyka impulsowa.
figure(2);
impulse(obiekt_inercyjny);
grid on;

% Charakterystyka Nyquista.
figure(3);
nyquist(obiekt_inercyjny);
grid on;

% Charakterystyka Bodego.
figure(4);
bode(obiekt_inercyjny);
grid on;