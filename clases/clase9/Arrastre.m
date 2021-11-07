clear all;close all;clf;
t0 = 0.0;tf = 120;N = 200;v0y = 50;g = 9.81; b1 = 0.07;m = 1;
dt = (tf-t0)/N; t(1) = t0; v(1) = v0y;
f = @(t,v) -g -(b1/m)*(v); % dv/dt = g -(b1/m)*(v);
% Solución exacta
vE = @(t) v0y*exp(-(b1/m)*t) - (m*g/b1)*(1 - exp(-(b1/m)*t)); 
tE = [t0:0.01:tf];
v1 = vE(tE);
[t2,v2] = EulerAdelante(f,t0,tf,v0y,100)
[t3,v3] = EulerModificado(f,t0,tf,v0y,100)
[t4,v4] = EulerAtrasado(f,t0,tf,v0y,100)
figure(1);clf;
plot(t,v,'b','linewidth',2,t2,v2,'r','linewidth',2,...
     t3,v3,'k', 'linewidth', 2, t4,v4,'g', 'linewidth', 2);grid on;

