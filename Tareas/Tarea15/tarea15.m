% Tarea 15
%  07 de Diciembre del 2021
% ODE45 para el pendulo total 


clear all;close all; clc;

g = 9.81; l = 1.5; theta0 = [pi/6, 3]
t = 0:0.01:10;

f = @(t,theta) [theta(2); -(g/l)*sin(theta(1))];

[t,theta] = ode45(f,t,theta0);

figure(1);clf;
plot(t,theta(:,1),'-b','linewidth',2);grid on;
title('Posición angular del pendulo (\theta vs tiempo)');
xlabel('Tiempo [s]');ylabel('\theta[rad]');
print -djpeg -r100 theta.jpeg

figure(2);clf;
plot(t,theta(:,2),'-r','linewidth',2);grid on;
title('Velocidad angular del pendulo (\omega vs tiempo)');
xlabel('Tiempo [s]');ylabel('\omega[rad/s]');
print -djpeg -r100 omega.jpeg