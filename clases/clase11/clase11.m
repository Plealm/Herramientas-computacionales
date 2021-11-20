% Método del punto medio
% Pedro Leal

clear; clc; clf;

tf = 100; t = 0:0.05:tf; N = 500; g = 9.81; m = 10; c= 0.1; dt = tf/N;
t = zeros(1, N+1); y = zeros(1, N+1); vy = zeros(1, N+1);
t(1) = 0; y(1) = 0; vy(1) = 10;

for n =1:N
  t(n+1) = n*dt;
  yhalf = y(n) + vy(n) *(dt/2);
  vyhalf = vy(n) + (g - (c/m)*vy(n))*(dt/2);
  y(n+1) = y(n) + vyhalf*(dt);
  vy(n+1) = vy(n) + (g - (c/m)*vyhalf)*(dt/2);
  endfor
figure(1);clf;
plot(t, y, 'b', 'linewidth', 3)
figure(2);clf;
plot(t, vy, 'b', 'linewidth', 3)