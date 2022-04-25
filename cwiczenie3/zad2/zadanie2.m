clear;clc;close all;

obj = tf(1, [2 2 0]);

figure(1);
step(obj);
grid on;

figure(2);
impulse(obj);
grid on;

figure(3);
nyquist(obj);
grid on;

figure(4);
bode(obj);
grid on;