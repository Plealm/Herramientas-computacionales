% Clase 29
% Febrero 01 del 2022
% Calculo de pi con respecto a la 
% integración de una gaussiana por Simpson

clear all; close all; clc;

a = -4.; b = 4.; n = 1e2; h = (b - a)/(2*n);
x = a:h:b;

f = @(x) exp(-x.^2);
y = f(x);
i = 0:2*n;
coeff = 3 + (-1).^(i+1); 
coeff(1) = 1; 
coeff(end) = 1;

AreaSimpson = (h/3)*sum(coeff.*y) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
x1 = a:0.01:b;
y1 = exp(-x1.^2);
area(x1, y1, 'FaceColor', 'Blue')
format long;
AreaSimpson^2
error = 100*(abs(pi - AreaSimpson^2))/pi