function [x, y] = EulerAdelante(f, xi, xf, yi, N)
  h = (xf - xi)/N;
  % Se inicializa vectores con zeros
  x = [xi zeros(1,N)];
  y = [yi zeros(1,N)];
  
  for n = 1:N
    x(n + 1) = x(n) + h;
    y(n + 1) = y(n) + h*f(x(n), y(n));
  endfor
endfunction
