% Clase 18
%  07 de Diciembre del 2021
% ODE45 

clear all;close all;tic
k1 = 1; k2 = 1; k3 = 1; k4 = 1;m1 = 1; m2 = 1; m3 = 1;
x0 = [1,0,-1,0,2,0]; t=0:0.05:100;
f = @ (t,x) [x(2); - (k1/m1)*x(1)  + (k2/m1)*(x(3) - x(1));                                        
            x(4); - (k2/m2)*(x(3) - x(1)) + (k3/m2)*(x(5) -x(3));
            x(6); - (k3/m3)*(x(5) - x(3)) - (k4/m3)*x(5) ];
[t,x] = ode45 (f, t, x0);

figure (1);clf;
subplot(3, 1, 1);plot (t, x(:,1),'-b','linewidth',2) ;grid on;
subplot(3, 1, 2);plot (t, x(:, 3),'-b', 'linewidth',2) ;grid on;
subplot(3, 1, 3);plot (t, x(:,5),'-b', 'linewidth', 2); grid on;
figure (2);clf;
subplot (3,1,1);plot (t,x(:,2),'-b', 'linewidth', 2); grid on;
subplot (3,1, 2) ;plot (t,x(:, 4),'-b','linewidth',2) ;grid on;
subplot (3,1,3) ;plot (t,x(:,6), '-b','linewidth', 2); grid on; toc

% Realizar el pendulo total 