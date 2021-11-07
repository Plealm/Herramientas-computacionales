
clear all;close all;clf;
f = @(x,y) y./x + x.^(2).*cos(2*x); % dy/dx = x/y
g = @(x) (1/2)*x.^(2).*sin(2*x) + (1/4)*x.*cos(2*x) + (7/4)*x;
xa = [pi:(2*pi-40)/1000:40];
ya = g(xa);
%         EulerModificado(f,xi,xf,yi,N)
[xn,yn] = EulerModificado(f,pi,40,2*pi,1000)