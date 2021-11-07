% Pedro Jose Leal
% Clase 8
clear;clc;clf;

"""Método de Euler para solución de EDO."""

%h = 0.01; N = 200; y(1) = 1;
% dy/dx = -6y

%for n=1:N
%  x(n+1) = n*h;
%  y(n+1) = y(n) + h*(-6*y(n));
%endfor

%figure(1);clf;
%plot(x, y, 'linewidth', 3);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comparación Analitica y Númerica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%x1 = 0:0.01:2; 
%y1 = exp(-6*x1);
%figure(2);clf;
%plot(x, y,'b*', x1, y1, 'r*', 'linewidth', 6);
%grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Error
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%sprintf('El Error es: %f \n', sqrt(sum(y - y1).^2/size(x, 2)))

"""Segundo ejemplo"""

ti = 0; tf = 2; N = 100; dt = (tf -ti)/N;
y0 = 1;
t(1) = ti;
y(1) = y0;

f = @(t, y) 3 + t - y; % dy/dt = 3 + t -y

for n = 1:N
  t(n + 1) = t(n) + dt;
  y(n + 1) = y(n) + dt*f(t(n), y(n));
endfor

figure(1);clf;
plot(t, y, 'linewidth', 3);grid on;

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Comparación Analitica y Númerica
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

t1 =0:0.01:2; y1 = 2 + t - exp(-t);
figure(2);clf;
plot(t, y,'b+', t, y1, 'r.', 'linewidth', 3);
legend('Euler', 'Analitico')
sprintf('El Error es: %f \n', sqrt(sum(y - y1).^2/size(t, 2)))
% Tarea usar el metodo de euler y metodo de euler modificado con 
% alguna ecuación diferencial y denotar su error