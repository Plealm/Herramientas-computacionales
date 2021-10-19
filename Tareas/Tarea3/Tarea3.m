% Tarea clase4
% Pedro Jose Leal
clc; clear;
x = -2:0.25:2;
y = x;

[X, Y] = meshgrid(x, y);

% posición partícula negativa
xCn = 0.5; yCn = 0; a = 0.4;

% posición partícula positiva
xCp = -0.5; yCp= 0; 

% Campulo Electrico
Qn = -20;  % carga Particula negativa
Qp = 20;  % carga particula positiva

eps0 = 0.854e-12; % permitividad en el vacio
kC = 1/(2*pi*eps0); 

% Se modifica el centro para la particula negativa
Rx = X - xCn; 
Ry = Y - yCn;
R = sqrt(Rx.^2 + Ry.^2).^3;
% Las ecuaciones del campo Negativo
Ex = kC.*Qn.*Rx./R;
Ey = kC.*Qn.*Ry./R;
% Modificación del centro para la particula positiva
Rx = X - xCp;
Ry = Y - yCp;
R = sqrt(Rx.^2 + Ry.^2).^3;
% Ecuaciones del campo positivo
Ex = Ex + kC.*Qp.*Rx./R;
Ey = Ey + kC.*Qp.*Ry./R;
% Nomralización de los vectores
E = sqrt(Ex.^2 + Ey.^2);
% definicion de los vectores con la normalización
u = Ex./E;
v = Ey./E;

% Grafica

figure();clf;
% Graficación del campo Electrico con un 
% escalamiento de 0.6 a los vectores

h = quiver(X, Y, u, v, 'autoscalefactor', 0.6);
% Selección de colo y ancho de los vectores
set(h, 'color', [1 0.5 0], 'linewidth', 1.5);
% imposición de tamañan en los ejes x y
axis([-2 2 -2 2]);

% Graficación de las partículas
% Partícula negativa
h = rectangle('Position', [xCn-a/2, yCn-a/2, a, a + 0.1],...
    'curvature', [1 1]);
% Definición de su color
set(h, 'Facecolor', [0 0 1], 'Edgecolor', [0 0 1]);
% el signo '-'
text(0.415, 0.065, '-', 'Color', 'White', 'Fontsize', 50);

% Partícula positiva
h = rectangle('Position', [xCp-a/2, yCp-a/2, a, a + 0.1], ...
    'curvature', [1 1]);
% Definición de su color
set(h, 'Facecolor', [1 0 0], 'Edgecolor', [1 0 0]);
% El signo '+'
text(-0.625, 0.05, '+', 'Color', 'White', 'Fontsize', 30);
% Guardar la imagen
print -djpeg -r100 campo_dipolo_electrico.jpeg


% Codigo tomado y cambiado de:
% https://www.youtube.com/watch?v=k9srU6aQfL0&list=PLJPaSl
% ai3G9btSd77i-HBWXnf6556Co52&index=2