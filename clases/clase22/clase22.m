% clase 22
% 11 de Enero del 2022
% Ecuación de difusión con amortiguamiento en 3D
clear all;clc; close all;

numx = 51; numy = 51; numt = 400;
dx = 1/(numx - 1); dy = 1/(numy - 1);dt = 0.001;
mu = 0.3; sigma = 0.5; D = 0.05; U = 8;
x = 0:dx:1;y = 0:dy:1;

C = zeros(numx, numy, numt);
C(1:numx-1,1,1) = 0; C(1:numx-1,numy,1)=0;
C(1,1:numy-1,1) = 0;C(numx,1:numy-1,1)=0;
t(1) = 0; [X, Y]= meshgrid(x, y);

for i = 2:numx-1
  for j = 2:numy-1
    C(i,j,1) = exp(-0.5*(x(i) - mu)^(2)/(2*sigma^2)...
                   -0.5*(y(j) - mu)^(2)/(2*sigma^2))/...
                   sqrt(2*pi*sigma^2); 
  endfor
endfor

for j = 1:numt
  t(j+1) = t(j) + dt;
  for i = 2:numx-1
    for k = 2:numy-1
      C(i, k, j+1) = C(i, k,j) + (D*dt/dx^2)*...
      (C(i+1, k, j) - 2*C(i, k, j) + C(i-1, k, j)) - ...
      C(i, k,j) + (D*dt/dy^2)*...
      (C(i, k+1, j) - 2*C(i, k, j) + C(i, k-1, j)) - ...
      U*dt/(2*dx)*(C(i+1, k, j) - C(i-1, k, j)) -...
      U*dt/(2*dy)*(C(i, k+1, j) - C(i, k-1, j));
    endfor
  endfor
  figure(1);clf;surf(X, Y, C(:, :, j)); drawnow;view(130,25);
endfor

