% Pedro Jose Leal
% Clase 5

clc; clear; 

"""Operaciones logicas con arreglos."""

%a = [15 6 9 4 11 7 14];
%b = [8 20 9 2 19 7 10];

% Me determina que entradas son 
% mayores o menores escribiendolo con 1 o 0

%a > b;  
%a >= b;
%a < b;

% Me determina si las entradas son diferentes
% o iguales

%a ~= b; 
%a == b;

% se pueden recortar arreglos

%u = (a > b);

%c = a(a>6);

%T = [24 37 37 45 67 21 4 21 3 90 105];

%T1 = (T > 50);

% Para encontrar las ubicaciones se usa find

%find(T > 50);

% se pueden aumentar las condiciones logicas 

%a > b;
%a > 7;
%(a > b) & (a > 7);
%(a > b) | (a > 7);

% Para tomar las diferencias 

%~(a > b);

"""Tomando solo valores positivos."""

%x1 = 0:pi/30:3*pi;
%y1 = cos(x1);
% condiciono que solo sean los positivos
%y1 = y1.*(y1 > 0);
%figure(1); clf;
%plot(x1, y1); grid on;

"""Funcion a trozos"""

%x2 = 0:0.01:6;
%y2 = (2*x2).*(0 <= x2 & x2 < 1) + 2*(1 <= x2 & x2 < 3)+ ...
 %   (-x2 +5).*(3 <= x2 & x2 > 5);
%figure(2); clf;
%plot(x2, y2); grid on; axis([- 0.2 6 -0.1 2.3]);

"""Como quitar ceros"""

%x3 = -4*pi:pi/30:4*pi;
%x3 = x3 + (x3 == 0)*eps;
%y3 = sin(x3)./x3;

%figure(3); clf;
%plot(x3, y3); grid on;

"""Acotar una función."""

%x4 = -4*pi:pi/30:4*pi;
%y4 = tan(x4);
%y4 = y4.*(abs(y4)<100);
%figure(4); clf;
%plot(x4, y4); grid on;

"""Interfaz de usuario."""

%x = input('Ingresar un numero para calcular un logartimo: ');

%if x > 0
%    y = log(x);
%    fprintf('\n  El logaritmo de %f es %f. \n', x, y);
%else 
%    beep 
%    disp('El argumento de  Log(x) debe ser positivo')
%end

"""Tipos de graficos con switch."""

%x = [1 2 3 4 5 6 7 8 9 8 7 6 5 4 3 2 1];

%clasedeplot = 'pie3';

%switch clasedeplot
%    case 'bar'
%        bar(x); title('Bar', 'fontsize', 20)
%    case 'pie'
%        pie(x); title('Pie', 'fontsize', 20)
%    case 'pie3'
%        pie3(x); title('Pie 3D', 'fontsize', 20)
%    case 'plot'
%        plot(x); title('Plot normal', 'fontsize', 20)
%    case 'loglog'
%        loglog(x); title('Plot ejes log', 'fontsize', 20)
%    otherwise
%        warning('tipo de grafico no esperado')
% end

"""Uso de for."""

a(1) = 1; 
N = 19;

for i = 1:N
    a(i + 1) = (i^2 + 2*i - 1)/(i^2 + 2*i + 1)*a(i);
end

disp(a)

% Tarea: Hacer una sumatoria que calcule pi
% Serie de Taylor para sin o cos

