% Tarea 25
% Febrero 03 del 2022
% Volumen de una hiper-esfera en n dimensiones

clear all; close all; clc;

N = 1e5;
d = input('Dimensión a analizar: ');
inside = 0;

for j = 1:N
  x = rand(1, d);
  R = 0;
  for k = 1:d
    R += x(k)^2;
  endfor
  r = sqrt(R);
  if r <= 1
    inside += 1;
  endif
endfor


format long
V = R.^d*2^d*(inside/N);
Vexact = R.^d*pi^(d/2)*(1/(gamma((d/2)+1)));
error = 100*(abs(V- Vexact)/Vexact);
vol =[ 'Volumen calculado por Montecarlo: ' , num2str(V)];
vol1 = [ 'Volumen teórico: ' , num2str(Vexact)];
vol2 = ['El error porcentual es: ', num2str(error)];

disp('')
disp(vol)
disp(vol1)
disp(vol2)