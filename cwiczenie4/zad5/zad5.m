clear; close all; clc; %czyszczenie workspace

% Stałe.
k = 3.5; % Wzmocnienie układu inercyjnego.
T = 3.5; % Stała czasowa.
zeta = 0.35; % Współczynnik tłumienia.

% Czas.
Ts = 0.5; % Czas próbkowania.
t = 0:Ts:30; % zakres zmiennej czasu

% Stwórz obiekt inercyjny.
s = tf('s'); % Definicja operatora Laplace'a.
Iner = k / (T^2 * s^2 + 2 * zeta * T * s + 1); % Obiekt całkujący z inercją.
Iner_ZOH = c2d(Iner, Ts, 'zoh'); % Dyskretyzacja metodą ZOH.
Iner_Tustin = c2d(Iner, Ts, 'tustin'); % Dyskretyzacja metodą Tustina.

figure(1)

% Odpowiedź na wymuszenie skokowe.
[W, time] = step(Iner, t);
[Wd, time] = step(Iner_ZOH, t); % Układ ZOH.
[Wd1, time] = step(Iner_Tustin, t); % Układ Tustina.

% Charakterystyka odpowiedzi skokowej.
plot(t, W); hold all;
stairs(t, Wd);
stairs(t, Wd1);

legend('Ciągły', "ZOH", "Tustin");
grid on;
