% Solución del pendulo doble sin aproximaciones 
% por el método Runge-Kutta 4 (RK4). 

clear; close; clc;

% constantes del método
dt = 0.01;  h = dt; tf = 70; N = ceil(tf/h);
 
% Constantes del problema
m1 = input('masa m1: ');
m2 = input('masa m2: ');
m = m1/m2;
L1 = input('longitud del pendulo 1 (L1): '); 
L2 = input('longitud del pendulo 2 (L2): ');
g = 9.8;

%%%%%%%%%%%%%%% Condiciones inicales %%%%%%%%%%%%%%%%%%%%%%%%%%%%

theta =  pi/5;
omega = 1; 
theta2 = pi/4; 
omega2 = 1;
% Se crea un vector con las condiciones iniciales
y0 = [theta omega theta2 omega2]';
% Se toma el sistema de ecuaciones definido anteriormente
sistema = @(t, y)pendulo(t, y, m1, m2, L1, L2, g);
% Se crean los vectores que tendran las soluciones
yf = zeros(N, 4); t = zeros(N, 1);
yf(1, :) = y0';

for i = 1:N
  [t(i + 1), yf( i + 1, :)] = RK4(dt, sistema, t(i), yf(i, :)');
  x1(i) = yf(i + 1, 1, :);
  x2(i) = yf(i + 1, 2, :);
  x3(i) = yf(i + 1, 3, :);
  x4(i) = yf(i + 1, 4, :);
end

theta1 = yf(:, 1); omega1 =  yf(:, 2);
theta2 = yf(:, 3); omega2 =  yf(:, 4); 

figure(1);clf;

subplot(2,1,1);
plot(t, theta1, 'r-', 'Linewidth',1.5);
xlabel('t'); ylabel('\theta_1');
title('Pendulo doble sin aproximación\theta_1 ');grid on;

subplot(2,1,2);
plot(t, theta2, 'b-','Linewidth', 1.5);
xlabel('t'); ylabel('\theta_2');
title('Pendulo doble sin aproximación\theta_2');grid on;
print -djpeg -r100 RK4_.jpeg


figure(2); clf;
plot(theta1, theta2, 'b-', 'Linewidth', 0.0000001);
xlabel('\theta_1');ylabel('\theta_2');
title('Espacio de fase sin aproximación');grid on;
axis equal;
print -djpeg -r100 RK4_fase.jpeg