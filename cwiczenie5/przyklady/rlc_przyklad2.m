clear; close all; clc;

R = 7; % Ohm
L = 0.5; % Henr
C = 0.2; % Farad
E = 10; % Wolt

time = [0, 10];

X_0 = [0; 0; E / (2 * R)];

A = [
    -2 / (R * C), -1 / (R * C), 0
    -1 / (R * C), -1 / (R * C), -1 / C;
    0, 1 / L, 0
    ];

B = [
    E / (R * C);
    E / (R * C);
    0
    ];

dYdt = @(t, X) A * X + B;

[t, X] = ode45(dYdt, time, X_0);
plot(t, X);
legend("u_{C1}", "u_{C2}", "i_L");
