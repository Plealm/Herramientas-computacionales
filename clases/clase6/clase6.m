% Clase 6
% 26 Oct 2021

clc; clear; 

"""Uso del while"""

%term = 1;
%s = term;
%n = 1;

%while term > 1e-10
%    n = n + 1;
%    term = 1/n^2;
%    s = s + term;
%    if(n > 1000)
%       disp('Llego al loop 1000, se cancela')
%       break
%    end
%end

%fprintf('La suma es = %f y el iterador es %i \n',s, n)


"""Tipos de Interpolaciones"""

%dx = pi/5;
%x = 0:dx:2*pi;
%y = sin(x);
%xi = 0:dx/20:2*pi;
%yi = interp1(x, y, xi, 'linear');
%yic = interp1(x, y, xi, 'pchip');
%yls = interp1(x, y, xi, 'spline');


%figure(1);clf;
%plot(x, y, 'b.', xi, yi, 'r-')
%title('Interpolación Lineal')

%figure(2);clf;
%plot(x, y, 'b.', xi, yls, 'r-')
%title('Interpolación Spline')

%figure(3);clf;
%plot(x, y, 'b.', xi, yic, 'r-')
%title('Interpolación cuadratica')


%figure(4);clf;
%plot(x, y, 'b.', xi, yic, 'g-', xi, yi, 'r-', xi, yls, 'k-')
%legend('Data', 'Lineal', 'Cubica', 'Spline')
%title('Interpolación cuadratica'); grid on;

"""Interpolación Bidimensional."""

%x = [0:0.25*pi*pi]';
%y = x;
%z = sin(x)*cos(y')

%xn = [0:0.01:1]'*pi;
%yn = xn

%[Xn ,Yn] = meshgrid(xn, yn);
%zn = interp2(x,y,z,Xn,Yn, 'Spline');

%figure(1);clf;
%surf(x,y,z)
%figure(2);clf;
%surf(Xn, Yn, zn)




