% clase25
% 20 de Enero del 2022
% Ecuación de onda 3D

clear all; close all; clc;

a = 10; b = 60; c = 0.31; n = 60; m = 500;
dx = 1/(n - 1); dy = 1/(n - 1); dt = 1/(m - 1);
h = 1/(n - 1); k = 1/(m - 1);
x = 0:dx:1; y = 0:dy:1; t = 0:dt:1;
r = c*k/h; r2 = r^2; r22 = r^2/2; s1 = 1 - r^2; s2 = 2 - 4*r^2;
u = zeros(n,n,m);

for i = 2:n-1
  for j = 2:n-1
    u(i,j,1) = 0.1*(sech((i-9)/3))^2 + 0.1*(sech((j-9)/3))^2;
    u(i,j,2) = 2*u(i,j,1) + ...
    r22*(u(i+1,j,1) + u(i-1,j,1) + u(i,j+1,1)+ u(i,j-1,1));
  endfor
endfor

for k = 3:m
  for i = 2:n-1
    for j = 2:n-1
      u(i,j,k) = -u(i,j,k-2) + s2*u(i,j,k-1) + ...
      r2*(u(i+1,j,k-1) + u(i-1,j,k-1) + u(i,j+1,k-1)+ u(i,j-1,k-1));
    endfor
  endfor
endfor

[X, Y] = meshgrid(x, y);
for k = 1:m
  figure(1); clf;
  mesh(X,Y,u(:,:,k)'); axis([0 1 0 1 -15 15]); axis off;
  grid on; view([45 45 45]); drawnow;
endfor
