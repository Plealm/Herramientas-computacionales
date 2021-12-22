function [tf, xf] = RK4(dt,dx,t,x)
% Definición del algoritmo Runge-Kutta 
% de 4 orden.
  
tf = t + dt;
dthalf = dt/2;
k1 = dx(t, x);
k2 = dx(t + dthalf, x + dthalf*k1);
k3 = dx(t + dthalf, x + dthalf*k2);
k4 = dx(tf, x + dt*k3);
xf = x + dt*(k1 + 2*k2 + 2*k3 + k4)/6;
end