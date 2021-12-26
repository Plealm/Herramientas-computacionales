% Clase 13
%  18 de noviembre del 2021
% Algoritmo de Verlet a un oscilador 
clear all: close all:
dt = 0.01; ti = 0; tf = 3.0; g = 9.8; m = 0.2;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
x(1) = 1.0; vx(1) = 0.02; 
x(2) = x(1) + vx(1)*dt;
y(1) = 0.0; vy(1) = 5.01; 
y(2) = y(1) + vy(1)*dt;

t = ti:dt:tf; N = length(t);

for i = 3:N
  x(i) = 2*x(i - 1) - x(i - 2) - ...
         (4*pi^2*x(i-1)/(x(i - 1)^2 + y(i - 1)^2)^(3/2)...
         *dt^2);
  vx(i - 1) = (x(i) - x(i - 2))/(2*dt);
  y(i) = 2*y(i - 1) - y(i - 2) - ...
         (4*pi^2*y(i-1)/(y(i - 1)^2 + x(i - 1)^2)^(3/2)...
         *dt^2);
  vy(i - 1) = (y(i) - y(i - 2))/(2*dt);
endfor

vx(N) = (x(N) - x(N - 1))/(dt);
vy(N) = (y(N) - y(N - 1))/(dt);

figure(1); clf;
plot(t, x,'b', 'LineWidth', 2,...
     t, y,'r', 'LineWidth', 2);
grid on;

figure(2); clf;
plot(t, vx,'b', 'LineWidth', 2,...
     t, vy,'r', 'LineWidth', 2);
grid on;

figure(3); clf;
plot(x, vx,'b', 'LineWidth', 2,...
     y, vy,'r', 'LineWidth', 2);
grid on;
