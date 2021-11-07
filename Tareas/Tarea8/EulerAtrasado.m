## Función Euler Atrasado
function [x, y] = EulerAtrasado(f, xi, xf, yi, N)
  h = (xf-xi)/N;
  % Se inicializar vectores con zeros
  x = [xi, zeros(1,N)];
  y = [yi, zeros(1,N)];
  for i = 1:N
    x(i+1) = x(i) + h;
    ynew   = y(i) + h*f(x(i),y(i));
    y(i+1) = y(i) + (h)*(f(x(i + 1),ynew));
  end
end