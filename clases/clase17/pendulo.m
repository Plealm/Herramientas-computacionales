% Clase 17
%  02 de Diciembre del 2021
% solución del pendulo

clear all; close all;

g = 9.8; l = 10; omega0 = sqrt(g/l);

k = sin(20*pi/180/2); t = 0:0.01:50;

plot(t, 2*asin(k*ellipj(omega0*t, k)), ...
'-b', 'Linewidth', 2, t,(2*sin(k))*sin(omega0*t), ...
'-r', 'Linewidth', 2)

legend('Jacobi', 'sin')

% Tarea encontrar la velocidad angular del pendulo total