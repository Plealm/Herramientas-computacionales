% Clase 10 9 de Nov
% Pedro Leal

clear all; close all;
t0 = 0.0; tf =100; N = 1000;  k1=0.9;k2 =2.1;k3 =1.1;m1=0.9;m2 =1.1;
dt = (tf-t0)/N;  t(1) = t0; v1(1) = 0; x1(1) = 11; v2(1) = 0; x2(1) = 10;
fv1 = @(t,x1,x2,v1,v2) v1; 
fa1 = @(t,x1,x2,v1,v2) - (k1/m1)*(x1) + (k2/m1)*(x2 - x1);
fv2 = @(t,x1,x2,v1,v2) v2; 
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
title('Forzado-Amortiguado, x&t','fontsize',14);xlabel('t(seg)');ylabel('x(m)')
figure(2);clf;
plot(t,v1,'b','linewidth',2,t,v2,'r','linewidth',2);grid on;
title('Forzado-Amortiguado, x&t','fontsize',14);xlabel('t(seg)');ylabel('x(m)')
figure(3);clf;
plot3(x1,x2,v1,'b','linewidth',2);grid on;
title('Forzado-Amortiguado, x&v','fontsize',14);xlabel('x(m)');ylabel('v(m/seg)')

% Amomrtiguamiento -bv