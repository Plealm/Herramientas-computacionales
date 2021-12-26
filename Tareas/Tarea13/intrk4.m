function [tout, xout] = intrk4(dt, dx, t, x)
  tout = t + dt;
  dt_half = dt/2;
  
  k1 = dt*dx(t, x);
  k2 = dt*dx(t + dt_half, x + k1/2);
  k3 = dt*dx(t + dt_half, x + k2/2);
  k4 = dt*dx(t + dt, x + k3);
  
  xout = x + (k1 + 2*k2 + 2*k3 + k4)/6;
endfunction
