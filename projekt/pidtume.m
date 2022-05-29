clear; close all; clc;

time = 0:0.01:150; % Czas.

% Stwórz obiekt inercyjny dla kontrolera PID
num = 4.5; % Licznik.
denum = [15, 8, 1]; % Mianownik.
T0 = 2; % Opóźnienie.
Gs = tf(num, denum, "InputDelay", T0); % Obiekt inercyjny.

T_osc = 12.788; % Czas oscylacji.
Kkr = 1.05; % Wzmocnienie krytyczne.
% PID
Kp = 0.6 * Kkr; % Współcznynnik wzmocnienia regulatora PID.
Ti = T_osc * 0.5; % Stała czasowa dla regulatora PID, dla obiektu całkującego.
Td = T_osc / 8; % Stała czasowa dla regulatora PID, dla obiektu różniczkującego.
T = 1; % Stła czasowa dla regulatora PID, dla obiektu różniczkującego.
% PI
Kpp = 0.45 * Kkr; % Współczynnik wzmocnienia regulatora PI.
Tii = T_osc / 1.2; % Stała czasowa dla regulatora PI, dla obiektu całkującego.

% Stworzenie kontrolera PID
CPID = pid(Kp, Kp / Ti, Kp * Td, T);
% Stworzenie kontrolera PI
CPI = pid(Kpp, Kpp / Ti);

% Stworzenie obiektu inercyjnego z regulatorem.
TrefPID = getPIDLoopResponse(CPID, Gs, "closed-loop");
TrefPI = getPIDLoopResponse(CPI, Gs, "closed-loop");

% Charakterystyka skokowa.
figure(1);
step(time, Gs);grid on; hold on;
step(time, TrefPI)
step(time, TrefPID); hold off;
title("Charakterystyka Skokowa");
legend("Gs", "PI", "PID");

% Zaproksymuj obiekt inercyjny.
sysGs = pade(Gs, 2);
sysPI = pade(TrefPI, 2);
sysPID = pade(TrefPID, 2);

% Charakterystyka impulsowa.
figure(2);
impulse(time, sysGs); grid on; hold on;
impulse(time, sysPI);
impulse(time, sysPID); hold off;
title("Charakterystyka Impulsowa");
legend("Gs", "PI", "PID");

% Charakterystyka Nyquista.
figure(3);
nyquist(time, Gs); grid on; hold on;
nyquist(time, TrefPI);
nyquist(time, TrefPID); hold off;
title("Charakterystyka Nyquista");
legend("Gs", "PI", "PID");

% Charakterystyka Bodego.
figure(4);
bode(time, Gs); grid on; hold on;
bode(time, TrefPI);
bode(time, TrefPID); hold off;
title("Charakterystyka Bodego");
legend("Gs", "PI", "PID");