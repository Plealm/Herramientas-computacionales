% Clase 15
%  25 de noviembre del 2021
% Animación

clear all; close all;
dt = 0.05; tf = 5; N = ceil(tf/dt);
m = 1; b = 0.09;
x0 = 1.001; vx0 = 5.001;
z0 = 1.001; vz0 = 25.001;
y0 = [x0 vx0 z0 vz0]';
dynDragL = @(t, y) fmotProy(t, y, m, b);
dynDragI = @(t, y) fmotProyIdeal(t, y, m);
y_out = zeros(N, 4);
y_out1 = zeros(N, 4);
t = zeros(N, 1);
y_out(1,:) = y0';
y_out1(1,:) = y0';

for i = 1:N
  [t(i + 1), y_out(i+1, :)] = intrk4(dt, dynDragL, t(i), y_out(i,:)');
  x1D(i) = y_out(i+1, 1, :);
  x3D(i) = y_out(i+1, 3, :);
  %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  [t(i + 1), y_out1(i+1, :)] = intrk4(dt, dynDragI, t(i), y_out1(i,:)');
  x1I(i) = y_out1(i+1, 1, :);
  x3I(i) = y_out1(i+1, 3, :);
  plot(x1I, x3I,'-bo', x1D, x3D,'-ro');
  grid on; drawnow;
endfor
XD = y_out(:, 1); vXD = y_out(:, 2); 
YD = y_out(:, 3); vYD = y_out(:, 4);

XI = y_out1(:, 1); vXI = y_out1(:, 2); 
YI = y_out1(:, 3); vYI = y_out1(:, 4);

figure(1); clf;
 plot(XI, YI,'-bo', XD, YD,'-ro'); grid on;