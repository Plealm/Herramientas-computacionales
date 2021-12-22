% Animación del pendulo doble

clear; close; clc;
% constantes del método
dt = 0.1;  h = dt; tf = 50; N = ceil(tf/h);

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
sistema = @(t, y)pendulo(t, y, m1, m2, L1, L2, g);
% Se crean los vectores que tendran las soluciones
yf = zeros(N, 4); t = zeros(N, 1);
yf(1, :) = y0';
for i=1:N
[t(i + 1), yf(i + 1, :)] = RK4(dt , sistema, t(i), yf(i, :)');
end
% Se agrupan las soluciones
theta1 = yf(:, 1); omega1 =  yf(:, 2);
theta2 = yf(:, 3); omega2 =  yf(:, 4); 

for j=1:length(theta1)
x01=0;y01=0;
% Coordenadas de los pendulos
x1(j)=L1*sin(theta1(j));
y1(j)=-L1*cos(theta1(j));
x2(j)=x1(j)+L2*sin(theta2(j));
y2(j)=y1(j)-L2*cos(theta2(j));

figure(1);clf;
hold on
% Se grafican las cuerdas de los pendulos
plot([x01, x1(j)],[y01, y1(j)], 'linewidth',1.5,'b')
plot([x1(j),x2(j)],[y1(j),y2(j)],'linewidth',1.5,'b')
% Se grafican las masas
plot(x1(j),y1(j),'marker','.','markersize',30,'r') 
plot(x2(j),y2(j),'marker','.','markersize',30,'g')
% Se grafica el techo
plot([-1,1],[0,0],'linewidth',6,'k') 
hold off;
axis([-5,5,-5,5]) 
grid on
% Pausa entre cada iteracción
pause (0.0001) 
drawnow
endfor