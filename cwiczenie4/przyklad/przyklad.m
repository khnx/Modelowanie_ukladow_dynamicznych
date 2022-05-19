clear; close all; clc; %czyszczenie workspace

% Stałe.
k=3; %wzmocnienie układu inercyjnego
T1=1; %stała czasowa T1
T2=2; %stała czasowa T2
Ts=0.5; %czas próbkowania
t = 0:Ts:15; % zakres zmiennej czasu

% Stwórz obiekt inercyjny.
s=tf('s'); %definicja operatora Laplace’a s
Gos=k/((1+s*T1)*(1+s*T2)); %obiekt inercyjny II rzędu

% Charakterystyka skokowa, wykres ciągły.
fig1 = figure(1); %otwarcie okna graficznego o numerze 1
[Yc,time]=step(Gos,t); %odpowiedź układu na wymuszenie skokowe
plot(t,Yc); % graficzna charakterystyka odpowiedzi członu ciągłego na wymuszenie skokowe
hold all; %zablokowanie okna graficznego


[A,B,C,D]=tf2ss(Gos.num{1},Gos.den{1}); %przejście z transfer function do space state
P=expm(Ts*A);
I=eye(2); %zdefiniowanie macierzy jednostkowej
Q=(P-I)*A^(-1)*B;
U=ones(size(t)); %określenie jednostkowego wektora sterowań
X(:,1)=zeros(size(A,1),1);
for i=2:size(t,2)
    X(:,i)=P*X(:,i-1)+Q*U(i-1);
end
Y=C*X+D*U; %odpowiedź układu
stairs(t,Y); % wykres schodkowy odpowiedzi układu
grid on;
legend('Obiekt ciągły', 'Obiekt dyskretny ZOH','Location', 'Best');