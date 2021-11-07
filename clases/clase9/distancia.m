clear all;close all;clf;
t0 = 0.0;tf = 5;N = 500;v0x = 5;v0y = 25;g = 9.81; b1 = 0.1;m = 1;
dt = (tf-t0)/N; t(1) = t0; x(1) = 0;y(1) = 0;
fy = @(t) -(m*g/b1) + (m*g/b1 + v0y)*exp(-(b1/m)*t);
fx = @(t) (v0x)*exp(-(b1/m)*t);
for n=1:N
  t(n + 1) = t(n) + dt;
  xnew     = x(n) + dt*fx(t(n),x(n));
  x(n + 1) = x(n) + (dt/2)*(fx(t(n),x(n)) + fx(t(n + 1),xnew));
  ynew     = y(n) + dt*fy(t(n),y(n));
  y(n + 1) = y(n) + (dt/2)*(fy(t(n),y(n)) + fy(t(n + 1),ynew));
end
figure(1);clf;
plot(t,y,'b','linewidth',2);grid on;
figure(2);clf;
plot(t,x,'b','linewidth',2);grid on;
figure(3);clf;
plot(x,y,'b','linewidth',2);grid on;

% Convertir en funciones el bucle