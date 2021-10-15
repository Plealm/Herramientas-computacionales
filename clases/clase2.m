% Clase 2

% Pedro Jose Leal
clc;
clear;

disp('Sea a la suma de 3 veces 7')

a = 7 + 7 + 7

disp('Sea y la multiplicación de tres veces 7 ')

y = 7*7*7


x = a/y;

disp('La división de la suma y la multiplicación en format long: ')

format long
disp(x)

disp('Y en formato short: ')
format short
disp(x)

disp('Tambien estan las funciones usuales como exponencial de 10')
disp(exp(10))

disp('O logaritmo Natural de 2.7183')
disp(log(2.7183))

disp('Tambien en base 10')
disp(log10(2.7183))

disp('Ademas, se pueden usar numeros usuales como pi y función de sin')

disp(sin(pi))

disp('Las funciones trigonometricas estan en radianes')

disp('De igual manera estan las funciones inversas trigonometricas')

disp('como asin(1)')

disp(asin(1))

disp('De igual forma esta la raiz en numero complejo como sqrt de -17')

disp(sqrt(-17))

disp('Se encuentra la aritmetica de los complejos')

disp(sqrt(-1) + sqrt(-10))

disp('O poner como exponente un numero complejo')
disp(exp(sqrt(-5)))

disp('Para vectores')

u = [2 -3 5]



v = [4 -6 8]


disp('Suma de vectores y resta')

disp(u + v)
disp(u - v)

disp('Igual que multiplicar por escalares 2*u -(-5)*v')

disp(2*u - (-5)*v)

disp('Para transponer los vectores se les pone una comilla')
v'

disp('Y el producto tensorial')
u.*v

disp('Se usa el punto en una matriz para que se evalue por componente')

disp(u.^2)

disp('Para sumar los valores de u')

disp(sum(u))

disp('Para tomar la norma')

disp(sqrt(sum(u.^2)))

disp(norm(u))

disp('Se puede tomar los valores de las operaciones')
disp(cos(u))

disp('Para crear un rango')
t = 0:1:10;

disp('El tamaño es :')
disp(t)

disp('Espaciado lineal')
disp(linspace(1, 10, 10))

disp('Para que dos vectores se puedan sumar deben ser de la misma dimensión')

disp('Esta dot que me da el producto punto y cross el producto vectorial')

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('Matrices')

disp('Sea la matriz')
M = [2 -3 4; 4 5 -7; 8 9 10]

disp('Su tamaño es')
size(M)

disp('Se define una nueva matriz')
M1 = [0 -3 1; 4 -5 -7; -8 -9 1]

disp('la suma de matrices')
M + M1

disp('La resta de matrices')
M - M1

disp('Tambien se puede multiplicar por escalares 2*M - (-4)*M1')
2*M - (-4)*M1

disp('Para M al cuadrado por componentes')

M.^2


disp('Para tomar la primera linea del arreglo')

M(1,:)

disp('Tomando la sub matriz')

M(1:2, 1:2)

disp('Se puede crear matrices nxn de ceros, unos y diagonales')

zeros(5, 5)
ones(5, 5)
eye(5, 5)

disp('Se apuede crear matrices con valores aleatorios de 0 y 1')

rand(5, 5)

disp('Se puede tomar la inversa')

inv(M)

disp('Recordando que la inversa por la matriz debe dar la indentidad')

inv(M)*M

disp('Creando una matriz apartir del producto de dos vectores')

u'*v

disp('Para solucionar un sistema de ecuaciones se toma la matriz')

disp('Debe ser igual al vector')

W = [0 -1 2]

disp('Mirando el determinante del M')

det(M)

disp('Como su determinante es diferente de 0, se puede solucionar')

X = M\W'

disp('Los autovalores y los autovectores de una matriz se puede encontrar como')

[V, lambda]= eig(M)

disp('Sea x1 y y1')
x1 = [1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16 17]
y1 = rand(1, 17)

disp('La grafica se puede realizar con plot')

plot(x1, y1, 'ro-', 'markersize', 5, 'linewidth', 3)
grid on
xlabel('x')
ylabel('aleatorio')
title('Mi primera grafica')

disp('Para guardar la grafica se usa el comando')
print -djpeg -r100 Mi_grafica1.jpeg
print -dpdf -r100 Mi_grafica1.pdf
print -dpng -r100 Mi_grafica1.png