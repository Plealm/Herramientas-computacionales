% Tarea 14
%  02 de Diciembre del 2021
% Velocidad angular del pendulo total 

clear all; close all; clc;

g = 9.81; l = 10; w0 = sqrt(g/l);

k = sin(20*pi/180/2);
t = 0:0.01:50;

jacobi = 2*asin(k*ellipj(w0*t, k));
jacobid = diff(jacobi)./diff(t); 

figure(1); clf;
plot(t,jacobi , ...
'-b', 'Linewidth', 2, ...
t, 2*sin(k)*sin(w0*t), ...
'-r', 'Linewidth', 2);
legend('Jacobi', 'Sin');
title('Comparación de las solucion total y aproximada del pendulo');

t(end) = [];
figure(2); clf;
plot(t, jacobid,...
'Linewidth', 2);
title('Velocidad angular')
