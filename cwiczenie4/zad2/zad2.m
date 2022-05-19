clear; close all; clc; %czyszczenie workspace

% Stałe.
k = 3.5; % Wzmocnienie układu inercyjnego.
T = 3.5; % Stała czasowa.
T1 = 1.5; % Stała czasowa.
T2 = 2.5; % Stała czasowa.
T0 = 0.7; % Opóźnienie.
zeta = 0.35; % Współczynnik tłumienia.

% Czas.
Ts = 0.5; % Czas próbkowania.
t = 0:Ts:15; % zakres zmiennej czasu

% Stwórz obiekt inercyjny.
s = tf('s'); % Definicja operatora Laplace'a.
Iner = k / (s * (1 + s*T)); % Obiekt inercyjny III rzędu.

% Charakterystyka skokowa, wykres ciągły.
fig1 = figure(1); % Otwarcie okna graficznego o numerze 1/
[Yc, time] = step(Iner, t); % Odpowiedź układu na wymuszenie skokowe.
plot(t, Yc); % Graficzna charakterystyka odpowiedzi członu ciągłego na wymuszenie skokowe.
hold all; % Zablokowanie okna graficznego.

[A, B, C, D] = tf2ss(Iner.num{1}, Iner.den{1}); % Przejście z transfer function do space state.
P = expm(Ts * A);
I = eye(1); % Zdefiniowanie macierzy jednostkowej.
Q = (P - I) * A^(-1) * B;
U = ones(size(t)); % Określenie jednostkowego wektora sterowań.
X(:, 1) = zeros(size(A,1), 1);

for i = 2:size(t, 2)
    X(:, i) = P * X(:, i - 1) + Q * U(i - 1);
end

Y = C * X + D * U; % Odpowiedź układu.
stairs(t, Y); % Wykres schodkowy odpowiedzi układu.
grid on;
legend('Obiekt ciągły', 'Obiekt dyskretny ZOH','Location', 'Best');