% ecuación de duffing
clear all; close all;
g = 9.811; l = 1.0;m = 1.0; b = 0.2;
w = sqrt(g/l); tf= (2*pi/w)*14; F0 = 10;
N = 5000; dt = tf/N;
wf = 5; bet = 3.1;
t(1) = 0; x(1) = 1; vx(1)=0;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for n =  1:N
  t(n+1) = n*dt;
  xhalf = x(n) + vx(n)*(dt/2);
  vxhalf = vx(n) - (w^2)*x(n)*(dt/2)...
        - (bet/m)*x(n)^3*(dt/2)...
        -(b/m)*vx(n)*(dt/2)...
        + (F0/m)*cos(wf*t(n))*(dt/2);
  x(n+1) = x(n) + vxhalf*(dt);
  vx(n+1) = vx(n) - (w^2)*xhalf*(dt)...
        - (bet/m)*xhalf^3*(dt)...
        -(b/m)*vxhalf*(dt)...
        + (F0/m)*cos(wf*t(n))*(dt);
endfor
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
figure(1); clf;
plot(t, x, 'b-', 'linewidth',3);grid on;
figure(2); clf;
plot(t, vx,'b-', 'linewidth',3);grid on;
figure(3);clf;
plot(x, vx,'b-', 'linewidth',3);grid on;