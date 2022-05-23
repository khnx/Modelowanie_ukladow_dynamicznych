clear; close all; clc;
% Transmitancja G(s) = k / (Ts + 1) exp(-s*T0)
% Stałe:
k = 3.5;
T0 = 0.7;
T = 3.5;

% Nie działa.
% [lp, mp] = pade(T0, 0);
% [lo, mo] = series(k, [T, 1], lp, mp);

obiekt_inercyjny = tf(k, [T, 1], 'InputDelay', 3.4);

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
