clear; close all; clc;
% Transmitancja G(s) = ks / (Ts + 1)
% Stałe:
k = 3.5;
T = 3.5;

obiekt_inercyjny = tf([k, 0], [T, 1]);

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
