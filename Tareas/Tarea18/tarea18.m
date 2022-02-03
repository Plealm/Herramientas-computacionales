## Tarea 18
## 16 de Diciembre del 2021
## Triple pulso de la ecuación de difución
## con video

clear all;clc; close all;

numx = 41; numy = numx; numt = 500;
dx = 1/(numx - 1); dy = dx;dt = 0.001;
D = 0.01;mu1 = .5; sigma = 0.05; mu2 = .7; 
mu3 = .3; 
x = 0:dx:1;y = 0:dy:1;

C = zeros(numx, numy, numt);
C(1:numx-1,1,1) = 0; C(1:numx-1,numy,1)=0;
C(1,1:numy-1,1) = 5;C(numx,1:numy-1,1)=1;
t(1) = 0; [X, Y]= meshgrid(x, y);

for i = 2:numx-1
  for j = 2:numy-1
    C(i,j,1) = exp(-(x(i) - mu1)^(2)/(2*sigma^2)...
                   -(y(j) - mu1)^(2)/(2*sigma^2))/...
                   sqrt(2*pi*sigma^2) + ...
                   exp(-(x(i) - mu2)^(2)/(2*sigma^2)...
                   -(y(j) - mu2)^(2)/(2*sigma^2))/...
                   sqrt(2*pi*sigma^2) + ...
                   exp(-(x(i) - mu3)^(2)/(2*sigma^2)...
                   -(y(j) - mu3)^(2)/(2*sigma^2))/...
                   sqrt(2*pi*sigma^2); 
  endfor
endfor
fn = fullfile("Difusion.mp4");
w = VideoWriter(fn);
open(w);
for j = 1:numt
  t(j+1) = t(j) + dt;
  for i = 2:numx-1
    for k = 2:numy-1
      C(i, k, j+1) = C(i, k,j) + (D*dt/dx^2)*...
      (C(i+1, k, j) - 2*C(i, k, j) + C(i-1, k, j)) + ...
      (D*dt/dy^2)*...
      (C(i, k+1, j) - 2*C(i, k, j) + C(i, k-1, j));
    endfor
  endfor
  figure(1);clf;mesh(X, Y, C(:, :, j)); drawnow;view(10,75); axis([0 1 0 1 0 10]);
  axis off;
  writeVideo (w, getframe (gcf));
endfor
close(w);


