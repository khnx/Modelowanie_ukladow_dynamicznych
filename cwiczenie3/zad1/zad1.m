clear;close all; clc;
% Transmitancja: G(s) = k / (Ts + 1).
% Stałe:
k = 3;
T = 5;

% Utwórz obiekt inercyjny o zadanej transmitancji.
obiekt_inercyjny = tf(k, [T, 1]);

% Charakterystyka skokowa.
figure(1);
subplot(2,2,1);
step(obiekt_inercyjny);
grid on;

% Charakterystyka impulsowa.
subplot(2,2,2);
impulse(obiekt_inercyjny);
grid on;

% Charakterystyka Nyquista.
subplot(2,2,3);
nyquist(obiekt_inercyjny);
grid on;

% Charakterystyka Bodego.
subplot(2,2,4);
bode(obiekt_inercyjny);
grid on;