% clase 27
% 27 de Enero del 2022
% Calculo de Pi

close all; clc; clear all;

Nlanz = 500; Ninside= 0; t = 0:pi/30:2*pi;
X3 = cos(t); Y3 = sin(t);

figure(1); clf;
plot(X3, Y3, 'r-', 'Linewidth', 2); grid on; axis square; hold on;

for n=1:Nlanz
  Xrand = 2*rand-1;
  Yrand = 2*rand-1;
  Rrand = sqrt(Xrand^2 + Yrand^2);
  
  if (Rrand <= 1)
    Ninside += 1;
    X1(n) = Xrand;
    Y1(n) = Yrand;
    plot(X1, Y1, 'r*'); grid on; axis square; drawnow
  else   
    X2(n) = Xrand;
    Y2(n) = Yrand;
    plot(X2, Y2, 'b*'); grid on; axis square; drawnow
  endif
endfor

disp(['Total números lanzados: ' num2str(Nlanz) ' Puntos adentro: ' num2str(Ninside)])

format long

piapprox = 4*Ninside/Nlanz
disp(['Pi aproximado: ' num2str(4*Ninside/Nlanz)])
