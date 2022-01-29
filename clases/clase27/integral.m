% clase 27
% 27 de Enero del 2022
% Aproximación de la integral

clear all; close all; clc;

N = 1000; m = 0; x1 = 0:0.01:pi/2; y1 = sin(x1);
plot(x1, y1, 'r-', 'Linewidth', 2); grid on; hold on;

for n = 1:N
  x = (pi/2)*rand;
  y = sin(pi/2)*rand;
  if (y - sin(x) <= 0)
    m += 1;
    plot(x, y, 'r*', 'Linewidth', 2 ); grid on; 
    xlim([0 pi/2]); drawnow
   else
    plot(x, y, 'b*', 'Linewidth', 2 ); grid on; 
    xlim([0 pi/2]); drawnow
  endif
endfor

format long
Af = (m/N)*((pi/2)*(sin(pi/2)))
disp(['Area aproximada: ' num2str(Af)])