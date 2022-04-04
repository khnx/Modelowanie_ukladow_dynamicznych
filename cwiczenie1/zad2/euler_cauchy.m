clear; clc; close all;

h = 0.001;        % Step.                         % Krok, o ile przesuwa się czas
time = 2;         % Time.                         % Max czas trwania obliczeń
y = [4; 5];       % Initial conditions.           % Warunki początkowe, ile wynosi y, y', y'', y''' itd.
t = 0:h:time;     % Full timestamp vector.        % Wektor z czasem. Zaczyna się od 0 przesuwa co step i kończy na time

% Predeclare yres.
yres = zeros(2, length(t));                       % Nie istotne.

for i = 1:length(t)                               % Iteruj przez całość czasu.
  k1 = funkcja(t(i), y);                          % Jakaś funkcja chuj wie skąd.
  k2 = funkcja(t(i) + h, y + h*k1);               % Tu też.
  yres(:, i) = y + (0.5*h).*(k1 + k2);            % A tutaj oblicza wynik danej różniczki tak, że daje zwraca [funkcja, pochodna, pochodna2rzędu, itd...]
  y = yres(:, i);                                 % Przypisz uzyskane wartości do y, żeby użyć w następnej iteracji
end
% Wypisz.
figure(1)
plot(t,yres(1,:),'r',t,yres(2,:),'g--');grid on;
legend('ynum','dynum');