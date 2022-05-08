clear; close all; clc;
% Transmitancja G(s) = k / s(Ts + 1)
% Stałe:
k = 4;
T = 2;

obiekt_inercyjny = tf(k, [T, 1, 0]);

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