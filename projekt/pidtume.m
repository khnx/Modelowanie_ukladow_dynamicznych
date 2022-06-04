clear; close all; clc;

time = 0:0.01:5; % Czas.

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

% Zaproksymuj obiekt inercyjny.
sysGs = pade(Gs, 5);
sysPI = pade(TrefPI, 5);
sysPID = pade(TrefPID, 5);

% Charakterystyka skokowa.
figure(1);
step(sysGs);grid on; hold on;
step(TrefPI)
step(TrefPID); hold off;
title("Charakterystyka Skokowa");
legend("Gs", "PI", "PID");

% Charakterystyka impulsowa.
figure(2);
impulse(sysGs); grid on; hold on;
impulse(sysPI);
impulse(sysPID); hold off;
title("Charakterystyka Impulsowa");
legend("Gs", "PI", "PID");

% Charakterystyka Nyquista.
figure(3);
nyquist(Gs); grid on; hold on;
nyquist(TrefPI);
nyquist(TrefPID); hold off;
title("Charakterystyka Nyquista");
legend("Gs", "PI", "PID");

[tuned, info] = pidtune(Gs, "PID");
T_pi = feedback(tuned * Gs, 1);
figure(10);
step(T_pi);
figure(11);
bode(T_pi);

% Charakterystyka Bodego.
figure(4);
bode(Gs);
title("Charakterystyka Bodego Gs");
figure(5);
bode(TrefPI); grid on; hold on;
bode(TrefPID); hold off;
title("Charakterystyka Bodego");
legend("PI", "PID");