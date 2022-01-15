% clase 23
% 13 de Enero del 2022
% Metodo de relajación para la solución
% de una ecuación de laplace

close all; clear; clc;

N = 30; tol = 1e-6; a = 0; b = 1;c = 0; d = 1; k = 0;
h = (b-a)/N; h1 = h*h; x = a:h:b; y = c:h:d;
u2 = zeros(N+1, N+1); u1 = zeros(N+1, N+1);usol = zeros(N+1, N+1);
% condiciones inicales
for i = 1:N+1
  u2(1, i) = 0;
  u2(N+1, i) = y(i);
  u2(i, 1) = 0;
  u2(i, N+1) = x(i);
endfor

figure(1); clf; mesh(x, y, u2)

while max(max(abs(u1 - u2))) > tol
  k = k + 1;
  u1 = u2;
  for i =2:N
    for j = 2:N
      u2(i,j) = (u1(i-1, j) + u1(i+1, j) + u1(i, j+1) + u1(i, j-1))/4;
    endfor
  endfor
endwhile

figure(2); clf;mesh(x, y, u2);

for i = 1:N+1
  for j = 1:N+1
    usol(i, j) = x(i)*y(j);
  endfor
endfor

figure(3); clf; mesh(x, y, usol);