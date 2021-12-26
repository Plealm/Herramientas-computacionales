% Clase 17
%  02 de Diciembre del 2021
% Funciones de Jacobi 
clear all; close all;

k = 0.7;
x = -5:0.01:5;

[Sn, Cn, Dn] = ellipj(x, k);

figure(1); clf;
plot(x, Sn,'-b','LineWidth', 2,...
x, Cn,'-r','LineWidth', 2,...
x, Dn,'-k','LineWidth', 2);
legend('Sn', 'Cn', 'Dn',...
'location', 'best'); grid on;
title('Funciones elipticas de Jacobi');
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%5
[K, X] = meshgrid(0:0.1:1, -5:0.1:5);
[SN, CN, DN] = ellipj(X, K);

figure(2); clf;
surf(X,K, SN); xlabel('X');
ylabel('K'); zlabel('SN');
title('Superficie Función Eliptica de Jabobi SN');

figure(3); clf;
surf(X,K, CN); xlabel('X');
ylabel('K'); zlabel('CN');
title('Superficie Función Eliptica de Jabobi CN');

figure(4); clf;
surf(X,K, DN); xlabel('X');
ylabel('K'); zlabel('DN');
title('Superficie Función Eliptica de Jabobi DN');
