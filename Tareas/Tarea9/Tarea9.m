% Tarea 9 Solucionar un sistema acoplado de tres resortes con acoplamiento 
% Pedro Leal

clear all; close all;clc;
t0 = 0.0; tf =100; N = 1000;  k1=0.9;k2 =2.1;k3 =1.1;m1=0.9;m2 =1.1;
dt = (tf-t0)/N;  t(1) = t0; v1(1) = 0; x1(1) = 11; v2(1) = 0; x2(1) = 10;

% Amortiguamiento

b1 = input('Ingrese la constante de amortiguamiento b1 para la masa m1:  '); 
b2 = input('Ingrese la constante de amortiguamiento b2 para la masa m2:  ');

fv1 = @(t,x1,x2,v1,v2) b1*v1; 
fa1 = @(t,x1,x2,v1,v2) - (k1/m1)*(x1) + (k2/m1)*(x2 - x1);
fv2 = @(t,x1,x2,v1,v2) b2*v2; 
fa2 = @(t,x1,x2,v1,v2) - (k3/m2)*(x2) - (k2/m2)*(x2 - x1);
for n=1:N
  t(n+1)  = t(n)+ dt;
  x1new   = x1(n) + dt*fv1(t(n),x1(n),x2(n),v1(n),v2(n));
  v1new   = v1(n) + dt*fa1(t(n),x1(n),x2(n),v1(n),v2(n));
  x2new   = x2(n) + dt*fv2(t(n),x1(n),x2(n),v1(n),v2(n));
  v2new   = v2(n) + dt*fa2(t(n),x1(n),x2(n),v1(n),v2(n));
  x1(n+1) = x1(n) + (dt/2)*(fv1(t(n),x1(n),x2(n),v1(n),v2(n)) + fv1(t(n+1),x1new,x2new,v1new,v2new));
  v1(n+1) = v1(n) + (dt/2)*(fa1(t(n),x1(n),x2(n),v1(n),v2(n)) + fa1(t(n+1),x1new,x2new,v1new,v2new)); 
  x2(n+1) = x2(n) + (dt/2)*(fv2(t(n),x1(n),x2(n),v1(n),v2(n)) + fv2(t(n+1),x1new,x2new,v1new,v2new));
  v2(n+1) = v2(n) + (dt/2)*(fa2(t(n),x1(n),x2(n),v1(n),v2(n)) + fa2(t(n+1),x1new,x2new,v1new,v2new));
end

figure(1);clf;
plot(t,x1,'b','linewidth',2,t,x2,'r','linewidth',2);grid on;
legend('Distancia para m1 (x1)','Distancia para m2 (x2)');
Caption = sprintf('X vs t con amortiguamiento b1 = %.2f y b2 = %.2f', b1, b2);
title(Caption,'fontsize',14);
xlabel('t[seg]');ylabel('x[m]'); grid on;
filename = sprintf('X_vs_t.png');
saveas(gcf,filename)

figure(2);clf;
plot(t,v1,'b','linewidth',2,t,v2,'r','linewidth',2);grid on;
legend('Velocidad para m1 (v1)','Velocidad para m2 (v2)');
Caption1 = sprintf('V vs t con amortiguamiento b1 = %.2f y b2 = %.2f', b1, b2);
title(Caption1,'fontsize',14);
xlabel('t[seg]');ylabel('V[m/s]'); grid on;
filename = sprintf('V_vs_t.png');
saveas(gcf,filename)

figure(3);clf;

plot3(x1,x2,v1,'b','linewidth',2);grid on;
Caption2 = sprintf('Espacio de Fase de x1, x2 y v1 con b1 = %.2f y b2 = %.2f', b1, b2);
title(Caption2,'fontsize',14);
xlabel('x1[m]');ylabel('x2[m]');zlabel('v1[m/s]'); grid on;
filename = sprintf('Espacio_Fase_v1.png');
saveas(gcf,filename)

figure(4);clf;

plot3(x1,x2,v2,'b','linewidth',2);grid on;
Caption3 = sprintf('Espacio de Fase de x1, x2 y v2 con b1 = %.2f y b2 = %.2f', b1, b2);
title(Caption3,'fontsize',14);
xlabel('x1[m]');ylabel('x2[m]');zlabel('v2[m/s]'); grid on;
filename = sprintf('Espacio_Fase_v2.png');
saveas(gcf,filename)
