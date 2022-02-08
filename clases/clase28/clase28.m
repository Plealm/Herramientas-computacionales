% Clase 28
% Febrero 01 del 2022
% Calculo de pi con respecto a la 
% integración de una gaussiana por MonteCarlo

clear all; close all; clc;

a = -4.; b = 4.; n = 1e4; dt = (b-a)/n;
v = @(t) exp(-t^2);
num = 0.5*v(a) + 0.5*v(b);

for i = 1:(n-1)
  num = num + v(a + i*dt);
endfor

num = dt*num;

x = a:0.01:b;
y = exp(-x.^2);
area(x, y, 'FaceColor', 'Blue');

F = @(t) exp(t^3);

Vexacto = F(b) - F(a);
format long;
num^2
error = 100*(abs(pi - num^2))/pi