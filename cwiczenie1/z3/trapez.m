clear; clc; close all;

h = 0.001;        % Step.
time = 2;         % Time.
y = [-1; -2];     % Initial conditions.
t = 0:h:time;     % Full timestamp vector.

% Predeclare yres.
yres = zeros(2, length(t));

for i = 1:length(t)
  yres(:, i) = y + (h/2).*(funkcja(t(i), y) + funkcja(t(i) + h, y));
  y = yres(:, i);
end

% Exact solution.
ydok = (4*sin(t/2) + 4*cos(t/2) - 8*sin(t) - 7*cos(t)) / 3;

figure(1)
plot( ...
  t, ydok, 'b', ...
  t,yres(1,:),'r--', ...
  t,yres(2,:),'g--');
grid on;
legend('ydok', 'ynum','dynum');
