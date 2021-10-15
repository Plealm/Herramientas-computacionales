% Segunda clase
% Pedro Jose Leal

% primer archivo
clc; clear;

%x = -pi:0.05:pi;
%y = sin(x);
%z = cos(x);

%plot(x, y)
%hold on;
%plot(x, z)
%hold off;
%xlabel('\theta[rad]')
%ylabel('f(\theta[rad])')
%legend('sin(\theta)','cos(\theta)','Location','best')
%axis([-1.1*pi 1.1*pi -1.2 1.2])
%title('Funciones trigonométricas')
%grid on
%print -djpeg -r100 trig_func.jpeg

%Segundo programa

%x = -pi:0.05:pi;
%y = sin(x);
%z = cos(x);

%func = [y, y.^2, z, z.^2]
%subplot(2, 2, 1)
%plot(x, y,'-b')
%legend('sin(\theta)')
%subplot(2, 2, 2)
%plot(x,y.^2, '_g')
%legend('sin^{2}(\theta)')
%subplot(2, 2, 3)
%plot(x, z,'or')
%legend('cos(\theta)')
%subplot(2, 2, 4)
%plot(x, z.^2,'+y')
%legend('cos^{2}(\theta)')
%xlabel('\theta[rad]')
%ylabel('f(\theta[rad])')
%grid on


%figure(1); clf;
%plot(x, y);
%figure(2); clf;
%plot(x, z);


clear all; close all;
x = 0:0.05:10;% Me genera un vector x
y = 4*exp(2*x);% Me genera un vector y del mismo tamaño de x
figure(1);clf;
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,1)
plot(x,y,'-b');grid on;
xlabel('x');ylabel('y');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,2)
semilogy(x,y,'-b');grid on;
xlabel('x');ylabel('log(y)');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,3)
semilogx(x,y,'-b');grid on;
xlabel('log(x)');ylabel('y');
%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
subplot(2,2,4)
loglog(x,y,'-b');grid on;
xlabel('log(x)');ylabel('log(y)');
print -djpeg -r100 Ejes_func2.jpeg