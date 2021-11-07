clear;clc;clf;

f = @(x, y) x./y; % dy/dx = x/y
g = @(x) sqrt((x.^2) + 1); 

xa = [0:0.01:0.7];
ya = g(xa);

[x1, y1] = EulerAdelante(f, 0, 0.7, 1, 50);

plot(xa, ya, 'b', 'linspace', 3);
grid on;