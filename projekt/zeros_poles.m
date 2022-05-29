clear; close all; clc;
num = [4.5];
denum = [15, 8, 1];

% %% Stwórz obiekt inercyjny dla kontrolera PID
% s = tf("s");
% Gs = 4.5 / ((5*s + 1)*(3*s + 1));
% time = 0:0.01:10;
% 
% GsP = 1;
% GsI = 1 / (0.05 * s);
% GsD = 0.05 * s / (s + 1);
% 
% PID = GsP * (1 + GsI + GsD);
% 
% GsPID = Gs * PID;
% 
% %% Znajdź punkt przegięcia dla charakterystyki skokowej.
% % Stwórz obiekt inercyjny.
% Ps = tf(num, denum);
% % Zamień obiekt inercyjny na postać dyskretną.
% Pz = c2d(Ps, 0.00005, "zoh");
% % Stwórz charakterystykę krokową dla modelu dyskretnego.
% [y, t] = step(Pz);
% % Wykreśl charakterystykę skokową.
% plot(t, y); grid on; hold on;
% 
% d1y = gradient(y, t);
% d2y = del2(y, t);
% t_infl = interp1(d1y, t, max(d1y));
% y_infl = interp1(t, y, t_infl);
% slope = interp1(t, d1y, t_infl);
% intcpt = y_infl - slope*t_infl;
% tngt = slope*t + intcpt;
% 
% zeroline = t*0;
% maxline = t*0 + max(y);
% 
% plot(t, zeroline, t, maxline);
% plot(t, tngt, '-r', 'LineWidth', 1);
% plot(t_infl, y_infl, 'ro');
% hold off;
% 
% legend('y(t)', 'Tangent');

%% zeros, poles, gain
[zz, pp, kk] = tf2zp(num, denum);