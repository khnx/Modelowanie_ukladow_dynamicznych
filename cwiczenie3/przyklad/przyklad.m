% Generacja odpowiedzi skokowej i impulsowej dla obiektu inercyjnego I-go
% rzedu o transmitancji obiektu G(s) = 3/(2s+1) dla parametrów k = 3 i T=2
% oraz charakterystyk bodego i nyquista.

obiekt_iner1 = tf(3, [2, 1]);
figure(1);
step(obiekt_iner1);
grid;
figure(2);
impulse(obiekt_iner1);
grid;
figure(3);
nyquist(obiekt_iner1);
grid;
figure(4);
bode(obiekt_iner1);
grid;