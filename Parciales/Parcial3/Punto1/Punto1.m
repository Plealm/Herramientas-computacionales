% Tercer Parcial
% Primer Punto
clear all; close all;clc

L = 5; N = 110; 
dt = 1e-2;t = 0:dt:2;
x = linspace(0,L,N);dx = x(2)-x(1);

D = 5e-5;a = 9e-6;c = 4e-3;

u = zeros(length(x),length(t));

for i = 1:N
  u(i,1) = cos(x(i)^2*pi -10);
  u(i,N) = cos(10*x(i)^4/pi);
endfor

for j = 1:length(t)-1
    for i = 2:length(x)-1
        u(i,j+1) = (dt^2/(dt + D))*(u(i,j)/dt + D*(2*u(i,j) - u(i-1,j))/dt^2 +
        a*(u(i,j) - u(i+1, j))/dx + c^2*(u(i+1,j) -2*u(i,j) + u(i-1, j))/dx^2);
    endfor
endfor


figure(1); clf;
plot(x,u(:,1),x,u(:,ceil(0.5/dt)),x,u(:,ceil(1/dt)),x,u(:,ceil(1.5/dt)), x,u(:,ceil(2/dt)))
legend("t=0s","t=0.5s","t=1s","t=1.5s", "t=2s");
title('Comportamiento de u(x,t) para diferentes tiempos'); xlabel('X'); 
print -dpng -r100 u_t.png

figure(2);clf;
[tt,xx] = meshgrid(t,x);
mesh(xx,tt,u); colormap winter;
xlabel('Coordenada x')
ylabel('Tiempo (seg)')
zlabel('U(x,t)')
print -dpng solucion.png