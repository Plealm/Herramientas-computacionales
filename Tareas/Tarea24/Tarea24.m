% Tarea 24
% 1 de Febrero del 2022
% Integración por método de Simpson y MonteCarlo

clear all; close all; clc;

a = 0; b = pi/4; n1 = 3e3; h = (b - a)/(2*n1);
x = a:h:b;

f = @(x) 1./(sin(x).^4 + cos(x).^4);
y = f(x);
i = 0:2*n1;
coeff = 3 + (-1).^(i+1); 
coeff(1) = 1; 
coeff(end) = 1;

AreaSimpson = (h/3)*sum(coeff.*y) 
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
x1 = a:0.01:b;y1 = 1./(sin(x1).^4 + cos(x1).^4);m = 0;
figure(2);clf;
plot(x1, y1, 'r-', 'Linewidth', 2); grid on; hold on;

for n = 1:n1
  x2 = pi/4*rand;
  y2 = f(pi/4)*rand;
  if (y2 - 1./(sin(x2).^4 + cos(x2).^4) <= 0)
    m += 1;
    plot(x2, y2, 'r*', 'Linewidth', 2 ); grid on; 
    xlim([0 pi/4]); drawnow
   else
    plot(x2, y2, 'b*', 'Linewidth', 2 ); grid on; 
    xlim([0 pi/4]); drawnow
  endif
endfor

format long
A = (m/n1)*(pi/4*f(pi/4))
piapproxMC = A*2^(3/2)

piapproxSim = AreaSimpson*2^(3/2)
errorSim = 100*(abs(pi - piapproxSim))/pi
errorMC = 100*(abs(pi - piapproxMC))/pi
% Se concluye que MonteCarlo no es tan eficiente como el método de Simpson.
% errorSim =    2.827159716856459e-14
% errorMC =    6.750674693296201e-01




