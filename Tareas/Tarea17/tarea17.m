% Tarea 17
% 14 de Diciembre del 2021
% ecuación de difusión con perfil de pulso cuadrado

clear all; close all; tic
numx = 101; numt = 2001; dx = 1/(numx -1);
dt = 1.; D = 5e-6; D1 = 5e-6;
x = 0:dx:1; c = zeros(numx, numt); t(1) = 0;
c(1,1) = 0; c(numx, 1) = 0; nu = .5; A = 0.9; nu1 = .3;
mu = 0.5; sigma1 = 0.05; nu2 = .7; sigma2 = 0.02;

for i = 2:numx-1;
  if i < (numx - 1)/3
    c(i, 1) = 0;
  elseif i >= (numx - 1)/3 && i <= 2*(numx - 1)/3 
    c(i, 1) = 1;
  else 
    c(i, 1) = 0;
  end
endfor

for j = 1:numt
  t(j+1) = t(j) +dt;
   for i= 2:numx-1
       c(i,j+1) = c(i,j)+ D*(dt/dx^2)*(c(i+1,j)-2*c(i,j)+c(i-1,j));
   end
end
figure(1); clf;
for k=1:50:1001
   plot(x, c(:, k), 'Linewidth', 2); hold on; grid on;
end
figure(2); clf;
for r = 1:5:101
  plot(t, c(r, :), 'Linewidth', 2); hold on; grid on;
endfor

hold off; hold off;

figure(3); clf; 
[X, T] = meshgrid(x, t);
Cr = c'(1:20:2001,:);
Tr = T(1:20:2001,:);
Xr = X(1:20:2001,:);

surf(Xr, Tr, Cr); view(130, 30);
 xlabel('x');
 ylabel('t'); zlabel('C(x, t)'); toc