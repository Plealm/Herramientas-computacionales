% Primera tarea Herramientas
% Pedro José Leal
clc;clear;   % limpia los variables 

a = input('Ingrese el dato a: '); 
b = input('Ingrese el dato b: ');


disp('La suma de a y b :')
suma = a + b;
disp(suma)


disp('La resta de a y b :')
rest = a - b;
disp(rest)

disp('La multiplicación de a y b :')
mult = a * b;
disp(mult)

disp('La división de a y b en formato long:')
format long
div = a/ b;
disp(div)

disp('O en format short')
format short
disp(div)

disp('Algunas operaciones usuales aplicadas en a y b')

disp('Raiz de a')
disp(sqrt(a)) 

disp('Raiz de b')
disp(sqrt(b))

disp('logaritmo de a')
disp(log(a))

disp('logaritmo de b')
disp(log(b))

disp('Sea seno de a*pi')
disp(sin(a*pi))

disp('Sea cos de b*pi/17')
disp(cos(b*pi/17))
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('Comenzando con los numeros complejos')

c = input('Por favor ingrese un numero negativo c: '); 

if c < 0
    disp('perfecto')
else 
    disp('Este es un numero positivo')
    c = input('Por favor ingrese un numero negativo c: '); 
end

d = input('Por favor ingrese otro numero negativo d: '); 


if d < 0
    disp('perfecto')
else 
    disp('Este es un numero positivo')
    d = input('Por favor ingrese un numero negativo d: '); 
end

disp('Matlab usa aritmetica de numeros complejos')

disp('Tomando la raiz del numero negativo c')
disp(sqrt(c))

disp('Tomando la raiz del numero negativo d')
disp(sqrt(d))

disp('La suma de los anteriores')
disp(sqrt(c) + sqrt(d))

disp('La resta de c y d')
disp(sqrt(c) -sqrt(d))

disp('La multiplicación de c y d')
disp(sqrt(c)*sqrt(d))

disp('La división de c y d')
disp(sqrt(c)/sqrt(d))

disp('Ademas se puede tomar como exponente los numeros complejos')
disp('Para c')
disp(exp(sqrt(c)))

disp('Para d')
disp(exp(sqrt(d)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('Vectores')

n= input('indique de cuantas componentes sea el vector: ');

i=1;
while i<=n
  x(1,i)=input(' ');
  i=i+1;
end
disp('El vector es')
disp(x)

disp('Posee un tamaño')
disp(size(x))


disp('Creando un vector con componentes aleatorios de la misma dimensión')
y=rand(1,length(x))*10;
disp(y)


disp('Estos se pueden sumar')
disp(x + y)

disp('Se puede restar')
disp(x -y)

disp('Se encuentra su producto punto')
disp(dot(x, y))

if length(x) == 3
    disp('Su producto cruz')
    disp(cross(x, y))
else
    disp('Al ser mayor de 3 dimensiones no se puede calcular el producto cruz')
end


disp('La norma del introducido manualmente')
disp(norm(x))

disp('La norma del vector con componentes aleatorias')
disp(norm(y))

disp('Elevar al cuadrado las componentes de x (digitado)')
disp(x.^2)
disp('Elevar al cuadrado las componentes de y (aleatorio)')
disp(y.^2)


disp('El coseno de las componentes de x es')
disp(cos(x))

disp('El seno de las componentes de y es')
disp(sin(y))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')
disp('Se pueden crear rangos de dos maneras')
disp('La primera')
t1 = 0:1:20

disp('La segunda')
t2 = linspace(0,20,21)

disp('%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%')

disp('Matrices')


 m=input('Cuantas lineas desea que tenga la matriz  ');
n=input('Cuantas columnas desea que tenga la matriz  ');
for i=1:m
for j=1:n
A(i,j)=input('Escriba el elemento  ')
end
end
A=reshape(A,m,n)

disp('Sea una matriz aleatoria')
M = rand(m, n)*10

disp('El tamaño de las matrices es')
disp(size(A))



disp('la suma de matrices')
M + A

disp('La resta de matrices')
A - M

disp('Tambien se puede multiplicar por escalares 2*A - (-6)*M')
2*A - (-6)*M

disp('Para M al cuadrado por componentes')

M.^2


disp('Para tomar la primera linea del arreglo')

M(1,:)

disp('Tomando la sub matriz')

M(1:2, 1:2)

disp('Se puede crear una matriz con el producto de dos vectores con x y y')

M1 = x'*y

[m1, n1] = size(M);

if m1 - n1 ~=0
    disp('Para otras operaciones porfavor use una matriz cuadrada')
else
        
    disp('Se puede tomar la inversa')

    inv(M)
    
    disp('Su determinante')
    
    det(M)
    
    disp('Suponiendo un sistema de ecuaciones por MX = W, Tal que W')

    w = rand(1, n1)
    
    disp('La solución de este sistema de ecuaciones es')

    X = M\w'

    disp('Los autovalores y autovectores de la matriz intriducida a mano')

    [V, lambda]= eig(M)

end
    




%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%55

disp('Hacer graficas')
x=linspace(1,10,300);
y=log(x)+0.7*sin(8*x);
z=10./(x.^0.8)+1.9*sin(10*x);
w=5*exp(-(x-1).^2)+1.5*sin(15*x);
plot(x,y,'--',x,z,'.-.',x,w,'-')
legend('Gráfica y','Gráfica z','Gráfica z')
xlabel('Valor del eje X ')
ylabel('Valor del eje Y ')
title('Curva para tres funciones diferentes. ')
print -dpdf -r100 TresFUNCIONES1.pdf

