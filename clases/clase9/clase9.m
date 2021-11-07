% Pedro Jose Leal
% Clase 9

clc;clear;clf;
f = @ (x, y) y./x + x.^(2).*cos(2*x);
g = @ (x) (1/2)*x.^2*sin(2*x) + (1/4)*x.*cos(2*x)+(7/4)*x;
xa = [pi:(40 - pi)/1000:40];
ya = g(xa);

[xn, yn] = EulerAtrasado[f, pi, 40, 2*pi, 1000]

figure(1);clf;

plot(xa, ya, xn, yn)