clear; close all; clc;
% Transmitancja G(s) = k / (Ts + 1) exp(-s*T0)
% Stałe:
k = 5;
T0 = 3.4;
T = 1;

[lp, mp] = pade(T0, 1);
[lo, mo] = series();

obiekt_inercyjny = tf(lo, mo);

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