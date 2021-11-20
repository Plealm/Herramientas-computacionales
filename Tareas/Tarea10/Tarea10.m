%Tarea 10  Realizar un sistema acoplado de dos masa y tres resortes
% con el metodo de punto medio

% Pedro Leal

clear all; close all;
t0 = 0.0; tf =100; N = 1000;  k1=0.9;k2 =2.1;k3 =1.1;m1=0.9;m2 =1.1;
dt = (tf-t0)/N;  t(1) = t0; v1(1) = 0; x1(1) = 11; v2(1) = 0; x2(1) = 10;
fv1 = @(t,x1,x2,v1,v2) v1; 
fa1 = @(t,x1,x2,v1,v2) - (k1/m1)*(x1) + (k2/m1)*(x2 - x1);
fv2 = @(t,x1,x2,v1,v2) v2; 
fa2 = @(t,x1,x2,v1,v2) - (k3/m2)*(x2) - (k2/m2)*(x2 - x1);
for n=1:N
  t(n+1)  = n*dt;
  x1half   = x1(n) + (dt/2)*v1(n);
  v1half   = v1(n) + (dt/2)*(- (k1/m1)*(x1(n)) + (k2/m1)*(x2(n) - x1(n)));
  x2half   = x2(n) + (dt/2)*v2(n);
  v2half   = v2(n) + (dt/2)*(- (k3/m2)*(x2(n)) - (k2/m2)*(x2(n) - x1(n)));
  x1(n+1) = x1(n) + (dt)*v1half;
  v1(n+1) = v1(n) + (dt)*(- (k1/m1)*(x1half) + (k2/m1)*(x2half - x1half));
  x2(n+1) = x2(n) + (dt)*v2half;
  v2(n+1) = v2(n) + (dt)*(- (k3/m2)*(x2half) - (k2/m2)*(x2half - x1half));
end

figure(1);clf;
plot(t,x1,'b','linewidth',2,t,x2,'r','linewidth',2);grid on;
title('Forzado-Amortiguado, x&t','fontsize',14);xlabel('t(seg)');ylabel('x(m)');
filename = sprintf('t_vs_x.png');
saveas(gcf,filename)
figure(2);clf;
plot(t,v1,'b','linewidth',2,t,v2,'r','linewidth',2);grid on;
title('Forzado-Amortiguado, x&t','fontsize',14);xlabel('t(seg)');ylabel('x(m)');
filename = sprintf('t_vs_V.png');
saveas(gcf,filename)
figure(3);clf;
plot3(x1,x2,v1,'b','linewidth',2);grid on;
title('Forzado-Amortiguado, x&v','fontsize',14);xlabel('x(m)');ylabel('v(m/seg)');
filename = sprintf('Espacio_de_fase.png');
saveas(gcf,filename)