% Tarea 23
% 27 de Enero del 2022
% Aproximación de la integral

clear all; close all; clc;

N = 1000; m = 0; x1 = 0:0.01:2; y1 = exp(-(x1 - 1).^2/0.05);
plot(x1, y1, 'r-', 'Linewidth', 2); grid on; hold on;

for n = 1:N
  x = 2*rand;
  y = max(y1)*rand;
  if (y - exp(-(x - 1).^2/0.05) <= 0)
    m += 1;
    plot(x, y, 'r*', 'Linewidth', 2 ); grid on; 
    xlim([0 2]); drawnow
   else
    plot(x, y, 'b*', 'Linewidth', 2 ); grid on; 
    xlim([0 2]); drawnow
  endif
endfor

format long
Af = (m/N)*(2*max(y1))
disp(['Area aproximada: ' num2str(Af)])