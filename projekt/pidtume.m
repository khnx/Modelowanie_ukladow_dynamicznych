clear; close all; clc;

time = 0:0.01:50;

%% Stwórz obiekt inercyjny dla kontrolera PID
num = 4.5;
denum = [15, 8, 1];
T0 = 2;
Gs = tf(num, denum, "InputDelay", T0);

T_osc = 12.788;
Kkr = 1.05;
Kp = 0.46 * Kkr;
Ti = T_osc * 0.5;
Td = T_osc / 8;
T = 1;

Controller = pid(Kp, Kp / Ti, Kp * Td, T);

C = pidtune(Gs, "PID");

Tref_closed = getPIDLoopResponse(Controller, Gs, "closed-loop");

figure(1);
step(time, Tref_closed);grid on;
title("Step Response of the PID Controller");

sys = pade(Tref_closed, 0);

figure(2);
impulse(time, sys);grid on;
title("Impulse response of the PID Controller");

figure(3);
nyquist(time, Tref_closed); grid on;
title("Nyquist Response of the PID Controller");

figure(4);
bode(time, Tref_closed); grid on;
title("Bode Response of the PID Controller");

figure(5);
pzmap(Tref_closed); grid on;
title("Poles and Zeros of the PID Controller");