% Tarea 2

% Pedro Jose Leal Mesa

% Subplots con un for
clc; clear;close all;

x = 0:0.005:10; 

figure(1);
for i = 1:9
    subplot(3,3,i);
    plot(x, sin(i^2*x).*log(1/(i^i)*x));
    caption = sprintf('Funcion de i = %d', i);
    title(caption, 'FontSize', 8);
    grid on;
    axis([0 5 0 10]);
    label = sprintf('F(x)');
    ylabel(label, 'FontSize', 12) ;
    xlabel('x') 
end
 print -djpeg -r100 tarea2_1.jpeg
 
 
x = 0:0.005:5;
y = tan(2*x.^2 - pi/23).*exp(2*x.^(1/5));
figure(2);clf;

subplot(2,2,1)
plot(x,y,'ok');grid on;
title('Ambos ejes naturales', 'Fontsize', 12);
xlabel('x');ylabel('y');

subplot(2,2,2)
semilogy(x,y,'+g');grid on;
title('Eje y en log', 'Fontsize', 12);
xlabel('x');ylabel('log(y)');

subplot(2,2,3)
semilogx(x,y,'_r');grid on;
title('Eje x en log', 'Fontsize', 12);
xlabel('log(x)');ylabel('y');

subplot(2,2,4)
loglog(x,y,'-y');grid on;
title('Grafica loglog', 'Fontsize', 12);
xlabel('log(x)');ylabel('log(y)');
print -djpeg -r100 tarea2_2.jpeg