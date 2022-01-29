% clase 27
% 27 de Enero del 2022
% Analisis de los lanzamientos 
% para el calculo de Pi

close all; clc; clear all;

a = 500; b = 10000; n = 1000; 
dx = (b - a)/n; x = linspace(a, b, n);
y = zeros(n, 1); i = 1;

for Nrand = a:dx:b
  Ninside = 0;
  for nloops = 1:Nrand
    Xrand = 2*rand-1;
    Yrand = 2*rand-1;
    Rrand = sqrt(Xrand^2 + Yrand^2);
    if (Rrand <= 1)
      Ninside += 1;
    endif
  endfor
  piapprox = 4*Ninside/Nrand
  y(i) = piapprox;
  i += 1;
endfor

figure(1); clf;
plot(y, 'b.', 'MarkerSize', 10); grid on;

figure(2); clf;
hist(y, 100); grid on;

