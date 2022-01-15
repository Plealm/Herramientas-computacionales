## Tarea 18
## 16 de Diciembre del 2021
## Triple pulso de la ecuación de difución
## con video

clear all; close all; clc;
numx = 101; numt = 2001; dx = 1/(numx -1);
dt = 1.; D = 5e-6; D1 = 5e-6; D2 = 5e-6; 
x = 0:dx:1; c = zeros(numx, numt); t(1) = 0;
c(1,1) = 0; c(numx, 1) = 0; nu = .5; A = 0.9; nu1 = .25;
mu = 0.5; sigma1 = 0.05; nu2 = .5; sigma2 = 0.02;
nu3 = .75; sigma3 = 0.035;



for i = 2:numx-1;
  c(i, 1) = exp(-(x(i) - nu1)^2/(2*sigma1^2))/sqrt(2*pi*sigma1^2) +...
            exp(-(x(i) - nu2)^2/(2*sigma2^2))/sqrt(2*pi*sigma2^2) + ...
            exp(-(x(i) - nu3)^2/(2*sigma3^2))/sqrt(2*pi*sigma3^2);
endfor

for j = 1:numt
  t(j+1) = t(j) +dt;
   for i= 2:numx-1
       c(i,j+1) = c(i,j)+ D*(dt/dx^2)*(c(i+1,j)-2*c(i,j)+c(i-1,j));
   end
end
fn = fullfile("Difusión.mp4");
w = VideoWriter(fn);
open(w);
figure(1); clf;
for k=1:50:1001
   plot(x, c(:, k), 'Linewidth', 2); hold on; grid on;
   pause (0.1); drawnow;
  writeVideo (w, getframe (gcf));
end
close(w)


