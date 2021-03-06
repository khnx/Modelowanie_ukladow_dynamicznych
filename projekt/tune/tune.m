clear; close all; clc;

%% Stwórz obiekt inercyjny dla kontrolera PID
s = tf("s");
Gs_Open = 4.5 * exp(-2 * s) / (5 * s + 1) / (3 * s + 1);
Gs_Closed = feedback(Gs_Open, 1);

%% Dane.
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

%% Utwórz kontrolery.
% Stworzenie kontrolera PID.
C_PID = pid(Kp, Kp / Ti, Kp * Td, T);
% Stworzenie kontrolera PI.
C_PI = pid(Kpp, Kpp / Ti);

%% Utwórz system otwarty i zamknięty dla podanych kontrolerów oraz transmitancji.
% Układ o zamkiętym systemie.
Gs_PI_Closed = getPIDLoopResponse(C_PI, Gs_Open, "closed-loop");
Gs_PID_Closed = getPIDLoopResponse(C_PID, Gs_Open, "closed-loop");

% Układ o otwartym systemie.
Gs_PI_Open = getPIDLoopResponse(C_PI, Gs_Open, "open-loop");
Gs_PID_Open = getPIDLoopResponse(C_PID, Gs_Open, "open-loop");

%% Wykresy Bodego.
figure(1);
bode(Gs_PI_Open); grid on; hold on;
bode(Gs_PID_Open); hold off;
legend("PI", "PID");
title("Charakterystyki Bodego, układ otwarty");

% Marginesy
figure(2);
margin(Gs_PI_Open); grid on;
figure(3);
margin(Gs_PID_Open); grid on;

%% Wykresy Nyquista.
figure(4);
nyquist(Gs_PI_Open); grid on; hold on;
nyquist(Gs_PID_Open); hold off;
legend("PI", "PID");
title("Charakterystyki Nyquista, układ otwarty");

%% Wykresy odpowiedzi skokowej.
figure(5);
step(Gs_Closed); grid on; hold on;
step(Gs_PI_Closed);
step(Gs_PID_Closed); hold off;
legend("Gs", "PI", "PID");
title("Charakterystyki skokowe, układ zamknięty");