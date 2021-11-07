## Función de EulerAdelantado
function [x,y] = EulerAdelantado(f,xi,xf,yi,N)
  h = (xf-xi)/N;
  % Se inicializar vectores con zeros
  x = [xi zeros(1,N)];
  y = [yi zeros(1,N)];
  for i = 1:N
    x(i+1) = x(i) + h;
    y(i+1) = y(i) + (h)*(f(x(i), y(i)));
  end
end