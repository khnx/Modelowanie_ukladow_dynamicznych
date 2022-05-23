clear; close all; clc;
% Transmitancja G(s) = k / (T0*2s^2 + 2*x*T0*s + 1)
% Stałe:
k = 3.5;
T0 = 0.7;
zeta = 0.35;

obiekt_inercyjny = tf(k, [T0^2, 2*zeta*T0, 1]);

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
