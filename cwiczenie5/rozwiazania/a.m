clear; close all; clc;

E = 15; % Wolt
R = 20; % Ohm
L = 0.1; % Henr
C = 0.2; % Farad

time = [0, 10]; % s

X_0 = [0; E / (2 * R)];

A = [
    -1 / (R * C), -1 / C;
    1 / L, 0
    ];

B = [
    E / (R * C);
    0
    ];

dYdt = @(t, X) A * X + B;

[t, X] = ode45(dYdt, time, X_0);

plot(t, X);
legend("u_C", "i_L");
