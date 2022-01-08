% Clase 19
%  09 de Diciembre del 2021
% Resultado analitico de la ecuación de difusión

clear all; close all; clc;

D = 0.00005; nu = 0.5; sigma = 0.05;
nx = 101; dx = 1/(nx -1); x = 0:dx:1;
nt = 5000; dt = 1.0; t(1) = 0;

for i = 1:nt
  t(i+1) = t(i) + dt;
endfor

[X, T] = meshgrid(x, t);

phi = exp(-(X - nu).^2./(4*D.*T+2*sigma^2))./sqrt(pi*(4*D.*T+2*sigma^2));

figure(1);clf;

plot(x, phi(1,:), 'b-', 'linewidth', 2, ...
x, phi(100,:), 'r-', 'linewidth', 2,...
x, phi(400,:), 'g-', 'linewidth', 2,...
x, phi(1000,:), 'k-', 'linewidth', 2,...
x, phi(5000,:), 'k-', 'linewidth', 2);
grid on;
legend('C(t=1)', 'C(t=100)', 'C(t=400)',...
'C(t=1000)', 'C(t=5000)');
xlabel('Posición'); ylabel('\Phi (x)');

figure(2);clf;
phir = phi(1:20:3001, :);
Xr = X(1:20:3001, :);
Tr = T(1:20:3001, :);

surf(Xr, Tr, phir); view(130, 30);
colormap(jet);