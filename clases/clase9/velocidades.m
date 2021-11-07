clear all;close all;clf;clc;
t0 = 0.0;tf = 12;N = 100; v0x = 10;v0y = 40;g = 9.81; b1 = 0.07; m = 1;
dt = (tf-t0)/N; 
t(1) = t0;
x(1) = 0;
v(1) = 0;
f = @(t,v) g - (b1/m) * (v); % dv/dt = g - (b1/m) * (v) ;

for n=1:N
  t(n + 1) = t(n) + dt;
   vnew    = v(n)  + dt*f(t(n), v(n));
  v(n + 1) = v(n) + (dt/2) * (f(t(n), v(n)) + f(t(n + 1), vnew) );
end

 VE = (m*g/b1) * (1 - exp(- (b1/m) *t));    

% Comparación Euler Mod. & Sol. Analitica 
figure (1); clf;
plot(t,v, 'b','lineWidth',2);
hold on;
plot(t, VE,'r+');
grid on;