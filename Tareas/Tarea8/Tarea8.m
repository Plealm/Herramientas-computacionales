clc;clear; close all;
% Tarea 7
% Pedro Leal
% Usar el codigo de Euler atrasado, Euler adelantado y Euler modificado
% para solucionar el problema parabolico con arrastre 

# Definición de los parametros iniciales

t0 = 0.0;
tf = 5.0;
v0x = 10;
v0y = 40;
g = 9.81;
b1 = 0.07; 
m = 1; 
t(1) = t0;
v0 = 0;
v(1) = v0;
dv = @(t,v) g - (b1/m) * (v); % dv/dt = g - (b1/m) * (v) ;



for i = 1:10
N = 1*i;

## Solución por los métodos de euler

[te, ve] = EulerAdelantado(dv, t0, tf, v0, N);
[tm, vm] = EulerModificado(dv, t0, tf, v0, N);
[ta, va] = EulerAtrasado(dv, t0, tf, v0, N);

## Solución Teorica

h = (tf - t0)/N;
 tt = t0:h:tf;
 VE = (m*g/b1) * (1 - exp(- (b1/m) *tt));

# Se calcula el error por cada punto

errore = sqrt(sum(VE - ve).^2);
errorm = sqrt(sum(VE - vm).^2);
errora = sqrt(sum(VE - va).^2);

## Se gráfica la solución analitica vs los metodos de Euler

figure(i);clf;
plot(te, ve, 'bo', 'MarkerFaceColor','b','LineWidth', 2.5);
hold on;
plot(tt, VE,'r-', 'LineWidth', 2)
hold on;
plot(tm, vm,'ok', 'MarkerFaceColor','k', 'LineWidth', 2.5);
hold on;
plot(ta, va,'go','MarkerFaceColor','g', 'LineWidth', 2.5);
legend('Euler Adelantado', 'Solución Analitica', 'Euler Modificado', 'Euler Atrasado');
caption = sprintf('Solución EDO Mov parabolico con N = %d iteracciones y  C = %d',N, b1);
title(caption, 'Fontsize', 10);
grid on;
xlabel('Tiempo [s]', 'Fontsize', 15);
ylabel('Velocidad [m/s]', 'Fontsize', 15);

filename = sprintf('Euler%d.png',i);
saveas(gcf,filename)
###Se imprime los errores

fprintf('\nel error para euler adelante con N = %d iteracciones es %f\n',N,errore)
fprintf('el error para euler modificado con N = %d iteracciones es %f\n',N,errorm)
fprintf('el error para euler atrasado con N = %d iteracciones es %f\n',N,errora)
endfor