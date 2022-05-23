clear; close all; clc;
% Transmitancja G(s) = k / ((T1s + 1)(T2s + 1))
% Stałe:
k = 3.5;
T1 = 1.5;
T2 = 2.5;

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
