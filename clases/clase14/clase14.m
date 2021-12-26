% Clase 14
%  23 de noviembre del 2021
% Algoritmo Runge-kutta 4th

clear all; close all;

h = 0.1; t = 0.0; N = 50; v = 0.1;
f = @(t, v) 9.8 - 0.1*v^2;
fprintf('Paso 0: t = %12.8f, v = %12.8f \n', t, v)
for i = 1:N
  t = t + h;
  k1 = h*f(t, v);
  k2 = h*f(t + h/2, v + k1/2);
  k3 = h*f(t + h/2, v + k2/2);
  k4 = h*f(t + h, v + k3);
  v = v + (k1 + 2*k2 + 2*k3 + k4)/6;
  fprintf('Paso %d: t = %12.8f, v = %12.8f \n', i, t, v)
  fv(i) = v; t1(i) = t;
endfor

figure(1); clf;
plot(t1, fv)