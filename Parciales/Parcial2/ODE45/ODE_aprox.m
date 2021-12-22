% Solución del pendulo doble con aproximaciones 
% por el método Dormand-Prince (ODE45). 

clear; close; clc;

% tiempo del analisis
tspan = 0.01:0.01:70; 
% Constantes del problema
m1 = input('masa m1: ');
m2 = input('masa m2: ');
m = m1/m2;
L1 = input('longitud del pendulo 1 (L1): '); 
L2 = input('longitud del pendulo 2 (L2): ');
g = 9.8;

%%%%%%%%%%%%%%% Condiciones inicales %%%%%%%%%%%%%%%%%%%%%%%%%%%%

theta =  pi/6;
omega = 1; 
theta2 = pi/4; 
omega2 = 1;

% Se crea un vector con las condiciones iniciales
y0 = [theta omega theta2 omega2]';
% Se toma el sistema de ecuaciones definido anteriormente
sistema = @(t, y)penduloaprox(t, y, m1, m2, L1, L2, g);
% Se utiliza el algoritmo de ODE45 para la resolución 
% del problema
[t, x] = ode45(sistema, tspan, y0);

figure(1);clf;

subplot(2,1,1);
plot(t, x(:, 1), 'r-', 'Linewidth',1.5);
xlabel('t'); ylabel('\theta_1');
title('Pendulo doble con aproximación \theta_1 ');grid on;

subplot(2,1,2);
plot(t, x(:, 3), 'b-','Linewidth', 1.5);
xlabel('t'); ylabel('\theta_2');
title('Pendulo doble con aproximación \theta_2');grid on;
print -djpeg -r100 ODE_aprox.jpeg


figure(2); clf;
plot(x(:, 1), x(:, 3), 'b-', 'Linewidth', 0.0000001);
xlabel('\theta_1');ylabel('\theta_2');
title('Espacio de fase con aproximación');
grid on;
axis equal;
print -djpeg -r100 ODE_fase_aprox.jpeg