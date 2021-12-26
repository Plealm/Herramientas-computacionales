% Clase 17
%  02 de Diciembre del 2021
% Animación

clear all; close all;

h = 0.01; tf = 2.1; N = ceil(tf/h);
x0 = 1.001; vx0 = 0.001; z0 = 0.001; 
vz0 = 6.27001; 
y0 = [x0 vx0 z0 vz0]';
y_out = zeros(N, 4); 
t = zeros(N, 1);
dynamicalPlanet = @(t, y) fmotionPlanet(t, y);
y_out(1, :) = y0';
fn = fullfile ("Kepler.mp4");
w = VideoWriter (fn);
open(w);
for i = 1:N
  [t(i + 1), y_out(i+1, :)] = intrk4(h, dynamicalPlanet,...
  t(i), y_out(i, :)');
  x1(i) = y_out(i+1, 1, :);
  x3(i) = y_out(i+1, 3, :);
  plot(x1, x3,'-bo', 'LineWidth', 3, ...
  'MarkerEdgeColor', 'k', ...
  'MarkerFaceColor', [.49 1 .63],...
  'MarkerSize', 3); grid on;
  writeVideo (w, getframe (gcf));
endfor
close(w)

% Graficación de las funciones elipticas