% Clase 29
% Febrero 03 del 2022

clear all; close all; clc; 

d = 3; % dimensiones
n = 1e5; % Numero de ensayos montecarlo
Zn = 0;

for i = 1:n
  x1 = rand;
  x2 = rand;
  x3 = rand;
  R = sqrt(x1^2 + x2^2 + x3^2); % Distancia al origen
  if R <= 1
    Zn = Zn + 1; % contador de aciertos
  endif
endfor

V1D = 2^d*Zn/n % Calculo del volumen de la esfera 
Ve = (4/3)*pi % Calculo del volumen de la esfera 
error = 100*(abs(V1D - Ve)/Ve)