clear;clc;close all;
k = 6.9;
T = 21.37;

mom = tf(k, [T, 1]);

figure(1);
step(mom);
grid on;

figure(2);
impulse(mom);
grid on;

figure(3);
nyquist(mom);
grid on;

figure(4);
bode(mom);
grid on;