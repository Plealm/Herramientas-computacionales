% clase 26
% 25 de Enero del 2022
% Diferencias finitas para la ecuación de Schrodinger

clear all; close all; clc;
iimag = sqrt(-1); N = 100; w = 0.2; L = 50; 
h = L/(N-1); x = h*(0:N-1)-L/2;

% Dimensiones naturales
hbar = 1; m = 1; tau = 1;

% Termino cinético p²/(2m)
ham = zeros(N); coef = -hbar^2/(2*m*h^2);
for i = 2:N-1
  ham(i,i-1) = coef;
  ham(i,i) = -2*coef;
  ham(i,i+1) = coef;
endfor

ham(N, N) = -2*coef; ham(N, N-1) = coef; ham(N-1, N) = coef;
ham(1, 1) = -2*coef; ham(1, 2) = coef; ham(2, 1) = coef;

% Termino potencial V
dOscillator = zeros(N);
for i = 1:N
  dOscillator(i, i) = 0.5*m*w^2*x(i)^2;
endfor

dCN = inv(eye(N) + 0.5*iimag*(tau/hbar)*(ham + dOscillator))*...
(eye(N) - 0.5*iimag*(tau/hbar)*(ham + dOscillator));
x0 = 0; vel = 0.01; k0 = m*vel/hbar; sigma0 = L/10; 
Normpsi = 1/sqrt(sigma0*sqrt(pi));
psi = Normpsi*exp(iimag*k0*x').*exp(-(x' - x0).^2/(2*sigma0^2));

figure(1); clf;
plot(x, real(psi), 'r-', 'linewidth', 3, ...
x, imag(psi), 'b-', 'linewidth', 3);grid on;
legend('Componente real', 'Componente imaginario');

maxiter = L/(vel*tau);
T1 = 100;
pplot(:, 1) = psi.*conj(psi);

figure(2); clf;
for iter = 1:T1
  PSIr(:, iter) = real(psi);
  PSIi(:, iter) = imag(psi);
  psi = dCN*psi;
  pFinal = psi.*conj(psi);
  plot(x, pFinal, 'r-', 'linewidth', 3); grid on;
  axis([-20 20 -0.1 0.7]);
  title('Densidad de probabilidad'); drawnow
endfor

t = 1:T1;
[X, T] = meshgrid(x, t);

figure(3); clf;
mesh(T, X, PSIr')
title('Componente Real de \Psi');

figure(4); clf;
mesh(T, X, PSIi')
title('Componente Imaginaria de \Psi');