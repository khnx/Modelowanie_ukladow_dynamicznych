E = 20; % Wolt
R = 25; % Ohm
L = 0.15; % Henr
C = 0.15; % Farad

time = [0, 10];

X_0 = [
    E;
    E;
    0
    ];

A = [
    -1 / (R * C), -1 / (R * C), -1 / C;
    -1 / (R * C), -2 / (R * C), 0;
    1 / L, 0, 0
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