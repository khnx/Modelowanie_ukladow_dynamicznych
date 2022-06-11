clear; close all; clc;

R = 10; % Ohm
L = 1; % Henr
C = 0.3; % Farad
E = 5; % Wolt

time = [0, 10];

X_0 = [E, 0];
A = [
    -1 / (R * C), 1 / C;
    -1 / L, -1 * R / L
    ];
B = [
    0;
    E / L
    ];

dYdt = @(t, X) A * X + B;
[t, X] = ode45(dYdt, time, X_0);

plot(t, X);
legend("u_C", "i_L");
