clear; clc; close all;

h = 0.001;          % Step.
time = 10;          % Time.
y = [-1; -2];       % Starting conditions.
t = 0:h:time;       % Full timestamp vector.

% Predeclare yres.
yres = zeros(2, length(t));

for i = 1:length(t)
  yres(:, i) = y + h.*funkcja(t(i), y);
  y = yres(:, i);
end

ydok = -2.*sin(t) - cos(2.*t);

figure(1);
plot( ...
  t, ydok, 'b',             ...
  t, yres(1, :), 'r',       ...
  t, yres(2, :), 'g--');
grid on;
legend('ydok', 'ynum', 'dynum');