% Pedro Leal
% Tarea4


clc; clear;
fprintf('\n \n Calculo de exp(x)\n \n')

x = input('De un valor a x: ');
error = input('Defina hasta que cifra decimal desea que sea igual: ');
Ne = 0;
k = 0;
while  abs(exp(x) - Ne) > error
    Ne = (Ne + x^k/factorial(k));
    k = k + 1;
end
 
fprintf('\n El valor numerico es:\n %.15g con %d interacciones\n',...
        Ne, k);
   
fprintf('\n El valor exacto de la exponencial es: \n %.15g\n', exp(x));

fprintf('\n La diferencia es de: \n %.15g\n', abs(Ne - exp(x)))

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
fprintf('\n \n Calculo de pi\n \n')

p = 0;
m = 1E9;
pierror = input('Defina hasta que cifra decimal desea que sea igual: ');

for i= 0:m
    p = p + 4*((-1)^i)/(2*i +1); 
    error=abs(pi - p);
    
    if error <= pierror
        break
    end
end

fprintf('\n El valor numerico es:\n %.15g con %d interacciones\n',...
        p, i);
   
fprintf('\n El valor exacto de pi es: \n %.15g\n', pi);

fprintf('\n La diferencia es de: \n %.15g\n', abs(p - pi))

