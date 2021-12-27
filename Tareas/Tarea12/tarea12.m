% Tarea 12
% Ecuaciones de Kepler segun el método de Verlet

clear all; close all; clc;
dt = 0.01; ti = 0; tf = 3.0; g = 9.81; m = 0.2;

% Condiciones iniciales

x(1) = input('condición inical x: ');
vx(1)= input('condición inical vx: ');      
y(1) = input('condición inical y: ');
vy(1)= input('condición inical vy: ');      
z(1) = input('condición inical z: ');
vz(1)= input('condición inical vz: ');      

x(2) = x(1) + vx(1)*dt;
y(2) = y(1) + vy(1)*dt;
z(2) = z(1) + vz(1)*dt;

t = ti:dt:tf; N = length(t);

for i = 3:N
  x(i) = 2*x(i-1) - x(i-2) - (4*pi^2*x(i-1)/(x(i-1)^2 + ...
  y(i-1)^2 + z(i-1)^2)^(3/2))*dt^2;
  
  vx(i-1) = (x(i) - x(i-2))/(2*dt);
  
  y(i) = 2*y(i-1) - y(i-2) - (4*pi^2*y(i-1)/(x(i-1)^2 + ...
  y(i-1)^2 + z(i-1)^2)^(3/2))*dt^2;
  vy(i-1) = (y(i) - y(i-2))/(2*dt);
  
  z(i) = 2*z(i-1) - z(i-2) - (4*pi^2*z(i-1)/(x(i-1)^2 + ...
  y(i-1)^2 + z(i-1)^2)^(3/2))*dt^2;
  vz(i-1) = (z(i) - z(i-2))/(2*dt);
end
vx(N) = (x(N) - x(N-1))/(dt); 
vy(N) = (y(N) - y(N-1))/(dt); 
vz(N) = (z(N) - z(N-1))/(dt);


figure(1);clf;
plot(t, x, 'b', 'LineWidth',2 ,... 
t, y,'r','LineWidth', 2,... 
t, z,'g','LineWidth', 2);
grid on;
title('Orbita dependiente del tiempo del Planeta');
legend('componente x','componente y','componente z');
xlabel('Tiempo [s]'); ylabel('Distancia [m]');
print -djpeg -r100 posicionkepler.jpeg;

figure(2);clf;
plot(t, vx, 'b', 'LineWidth',2 ,... 
t, vy,'r','LineWidth', 2,... 
t, vz,'g','LineWidth', 2);
grid on;
title('Velocidades para la trayectoria del Planeta');
legend('componente x','componente y','componente z');
xlabel('Tiempo [s]'); ylabel('Velocidad [m/s]');
print -djpeg -r100 velocidadkepler.jpeg;


figure(3);clf;
plot(x, vx, 'b', 'LineWidth',2 ,... 
y, vy,'r','LineWidth', 2,... 
z, vz,'g','LineWidth', 2);
grid on;
title('Diagrama de fase')
legend('componente x','componente y','componente z')
xlabel('Distancia [m]'); ylabel('Velocidad [m/s]');
print -djpeg -r100 fasekepler.jpeg;

figure(4);clf;
plot3(x, y, z,'b','LineWidth', 2);
grid on;
title('Orbita del Planeta');
xlabel('x [m]');
ylabel('y [m]');
zlabel('z [m]');
print -djpeg -r100 trayectoriakepler.jpeg;