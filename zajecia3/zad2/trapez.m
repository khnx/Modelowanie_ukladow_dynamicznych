clear; clc; close all;

h = 0.001;        % Step.
time = 2;         % Time.
y = [4; 5];       % Starting conditions.
t = 0:h:time;     % Full timestamp vector.

% Predeclare yres.
yres = zeros(2, length(t));

for i = 1:length(t)
  yres(:, i) = y + (h/2).*(funkcja(t(i), y) + funkcja(t(i) + h, y));
  y = yres(:, i);
end

figure(1)
plot(t,yres(1,:),'r',t,yres(2,:),'g--');grid on;
legend('ynum','dynum');