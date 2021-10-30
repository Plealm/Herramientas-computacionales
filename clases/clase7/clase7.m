% Pedro Leal
% Clase 7
clc; clear;
"""Movimiento parabolico."""
%g = 9.81;
%v0 = 5.0;
%t = 0:0.01:1;
%y = v0*t - 0.5*g*t.^2;
%plot(t, y); grid on;
%tmax = size(t, 2);
%alturamax = y(1);

%for i = 2:tmax
%  if y(i) > alturamax
%    alturamax = y(i);
%  endif
%endfor
%fprintf('La altura máxima encontrada es = %f m\n', alturamax)


%g = 9.81;
%v0 = 5.0;
%t = 0:0.01:1.5;
%y = v0*t - 0.5*g*t.^2;
%i = 1;

%while y(i) >= 0
%  i = i + 1;
%endwhile

%fprintf('El tiempo empleado es = %f seg\n', t(i))
%fprintf('El tiempo empleado es = %f seg\n', 2*v0/g)

%t1 = 0:0.01:t(i);y1 = v0*t1 - 0.5*g*t1.^2;

%plot(t1, y1); grid on;

"""Movimiento parabolico tridimiensional con arrastre."""

%v0 = 250;
%g = 9.81;
%c = 0.05;  % arrastre
%m = 2;

%vt = m*g/c;
%theta = 65;
%x0 = 0;
%v0z = v0*sin(theta*pi/180);
%v0x = v0*cos(theta*pi/180);

%t = 2*v0z/g;

%tplot = linspace(0, t, 500);
%z1 = v0z*tplot - 0.5*g*tplot.^2;
%x1 = v0x*tplot;
%y1 = v0x*tplot;
%z = (vt/g)*(v0z + vt)*(1 - exp(-(g/vt)*tplot)) - vt*tplot;
%x = (vt*v0x/g)*(1 - exp(-(g/vt)*tplot));
%y = (vt*v0x/g)*(1 - exp(-(g/vt)*tplot));
%plot3(x1, y1, z1, 'r.', x, y, z, 'b.');
%grid on;
%legend('c = 0', 'c = 0.05')
%xlabel('x(m)'); ylabel('y(m)'); zlabel('z(m)');

"""Arrastre cuadratica."""

g = 9.81; c = 0.21; m = 2;
t = 0:0.01:40;
v1 = m*g/c*(1 - exp(-(c/m)*t));
v2 = sqrt(m*g/c)*tanh(sqrt(c*g/m)*t);
grid on;
plot(t, v1, 'b-', t, v2, 'r-')

% calcule la altura maxima y tiempo de vuelo del arrastre lineal