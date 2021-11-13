%Tarea 10  Realizar un sistema acoplado de dos resortes 
% Pedro Leal

clear all; close all;clc;
t0 = 0.0; tf =100; N = 1000; 
disp('Porfavor rellene las siguientes constantes fundamentales del sistema')
k1=input('Ingrese la constante elastica del primer resorte k1:  ');
k2=input('Ingrese la constante elastica del segundo resorte k2:  ');
m=input('Ingrese la masa del la particula a analizar m:  ');
l1 =input('Ingrese la distancia incial del resorte 1: ');
l2 =input('Ingrese la distancia incial del resorte 2: ');
d = l1 + l2;
xinicial = input('Ingrese la condición inicial de x: ');

dt = (tf-t0)/N;  t(1) = t0; v1(1) = 0; x1(1) = xinicial; 
xeq = (k1*l1 + k2*(d -l2))/(k1 + k2);

fv1 = @(t,x1,v1) v1; 
fa1 = @(t,x1,v1) - (k1 + k2)*(x1 - xeq);

for n=1:N
  t(n+1)  = t(n)+ dt;
  x1new   = x1(n) + dt*fv1(t(n),x1(n),v1(n));
  v1new   = v1(n) + dt*fa1(t(n),x1(n),v1(n));
  x1(n+1) = x1(n) + (dt/2)*(fv1(t(n),x1(n),v1(n)) + fv1(t(n+1),x1new,v1new));
  v1(n+1) = v1(n) + (dt/2)*(fa1(t(n),x1(n),v1(n)) + fa1(t(n+1),x1new,v1new)); 
end

figure(1);clf;
plot(t,x1,'b','linewidth',2);grid on;
Caption = sprintf('X vs t');
title(Caption,'fontsize',14);
xlabel('t[seg]');ylabel('x[m]'); grid on;
filename = sprintf('X_vs_t.png');
saveas(gcf,filename)

figure(2);clf;
plot(t,v1,'b','linewidth',2);grid on;
Caption1 = sprintf('V vs t ');
title(Caption1,'fontsize',14);
xlabel('t[seg]');ylabel('V[m/s]'); grid on;
filename = sprintf('V_vs_t.png');
saveas(gcf,filename)

figure(3);clf;

plot(x1,v1,'b','linewidth',2);grid on;
Caption2 = sprintf('Espacio de Fase ');
title(Caption2,'fontsize',14);
xlabel('x1[m]');ylabel('v1[m/s]');grid on;
filename = sprintf('Espacio_Fase.png');
saveas(gcf,filename)