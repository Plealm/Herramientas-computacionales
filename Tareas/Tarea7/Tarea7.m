clc;clear; close all;
% Tarea 7
% Pedro Leal
% Usar el codigo de Euler y Euler modificado para solucionar una EDO 


% La ecuación Diferencial de primer orden a solucionar es:
%
%     dQ/dt = E(t)/R - Q/(RC)
% 
% Que describe la rata de carga de un capacitor.
%
% Con condición inicial:
%      
%      Q(t = 0) = 0 
% Y tomando las constantes 
%
%    E = 200V    R = 1500Ω   C = 0.0025F
################################################################################

## Valor de las constantes

R = 1500;
C = 0.0025;
E0 = 200;  % Voltaje constante
ti = 0.0;
tf = 1.0;
y0 = 0; % Condición inical
t(1) = ti;
y(1) = y0;

## Definición de la función

dy = @(t, y) E0/R - y/(R*C);
for i = 1:10
N = 1*i;

## Solución analitica del problema 

tt = ti:(tf-ti)/N:tf;
yy = E0*C*(1 - exp(-tt/(R*C)));

# Se llaman los metodos de Euler


[te, ye] = EulerAdelantado(dy, ti, tf, y0, N);
[tm, ym] = EulerModificado(dy, ti, tf, y0, N);

# Se calcula el error por cada punto

errore = sqrt(sum(yy - ye).^2);
errorm = sqrt(sum(yy - ym).^2);

## Se gráfica la solución analitica vs los metodos de Euler
figure(i);clf;
plot(te, ye,'ok', 'MarkerFaceColor','k', 'LineWidth', 2.5);
hold on;
plot(tt, yy,'r-', 'LineWidth', 2)
hold on;
plot(tm, ym,'bo','LineWidth', 2.5);
legend('Euler Adelantado', 'Solución Analitica', 'Euler Modificado');
caption = sprintf('Solución EDO capacitor con N = %d iteracciones',N);
title(caption, 'Fontsize', 10);
grid on;
xlabel('Tiempo [s]', 'Fontsize', 15);
ylabel('Carga [Coulomb]', 'Fontsize', 15);
axis([0 1 0 0.15])
filename = sprintf('Euler%d.png',i);
saveas(gcf,filename)

###Se imprime los errores

fprintf('\nel error para euler adelante con N = %d iteracciones es %f\n',N,errore)
fprintf('el error para euler modificado con N = %d iteracciones es %f\n',N,errorm)
endfor
## Calculo del error


