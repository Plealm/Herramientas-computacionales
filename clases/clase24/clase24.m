% clase 24
% 18 de Enero del 2022
% Relajación para un cmapo magnetico

clear all; clc; clf; close all;

L =50; N = L+2; h=1/(L+1); q = 10;
rho(N, N) = zeros; V(N,N)= zeros;VNew(N,N)= zeros;
P =7; T = 2*pi/P;

for i = 1:P
  l = ceil(20*sin((i)*T)+L/2);
  m = ceil(20*cos((i)*T)+L/2);
  rho(l, m) = q/(h*h);
endfor

steps = 0; accuracy = 0.001;

while true
  for i =2:L+1
    for j = 2:L+1
      VNew(i, j) = 0.25*(V(i-1, j) + V(i+1, j) + V(i, j-1) +...
      V(i, j+1) + h^2*rho(i, j));
    endfor
  endfor
  
  error=0; n=0; steps=steps+1
  
  for i = 1:L+1
    for j = 1:L+1
      if VNew(i, j)~=0 && VNew(i, j)~=V(i, j)
        error =  error+abs(1-V(i,j)/VNew(i,j));
        n=n+1;
      endif
    endfor
  endfor


  if n~=0
    error = error/n
  endif

  if error < accuracy
    break;
  endif
 swap = V;
 V=VNew;
 VNew =swap;
endwhile

figure(1);clf;surf(V);
[Ex, Ey] = gradient(V);Ex = -Ex; Ey = -Ey; 
x = (1:N); y = (1:N);

figure(2);clf;
quiver(x, y, Ex, Ey);axis([0 N 0 N])

figure(3);clf;
E = sqrt(Ex.^2 + Ey.^2);
quiver(x, y, Ex./E, Ey./E);axis([0 N 0 N])
