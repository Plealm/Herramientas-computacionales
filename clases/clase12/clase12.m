% Clase 12
% Pedro Leal

clear all; close all; clc
N    = 6000;
m    = 4.2;
k    = 2.5;
b    = 0.01;
F    = 10;
wf   = 1.1*sqrt(k/m);
dt   = 0.01;
t(1) = 0;
t(2) = t(1) + dt; 
x(1) = 1;
v(1) = 0.1;
x(2) = x(1) + v(1)*dt;
v(2) = v(1) + (-(k/m)*x(1) - (b/m)*v(1) + (F/m)*sin(wf*t(1)))*dt;

for i = 3:N
    t(i) = t(i-1) + dt;
    x(i) = 2*x(i-1) - x(i-2) + (-(k/m)*x(i-1) - (b/m)*v(i-1) + (F/m)*sin(wf*t(i-1)))*dt^2;
    v(i) = (x(i-1) - x(i-2))/dt;
    a(i) = (v(i-1) - v(i-2))/dt;
    E(i) = 0.5*m*v(i)^2 + 0.5*k*x(i)^2;
end

figure(1)
plot(t,x)
figure(2)
plot(t,v)
figure(3)
plot(t,a)
figure(4)
plot(x,v)
figure(5)
plot(t,E)

%Arrastre lineal en x y en y con el algoritmo verlet