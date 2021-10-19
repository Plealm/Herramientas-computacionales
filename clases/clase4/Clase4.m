% Clase 4
% Pedro Jose Leal Mesa

clc; clear;

"""Esfera 3D."""

%dphi = pi/100;
%N = 30;
%phi = 0:dphi:N*(2*pi);
%theta = phi/N/2;
%r = 1;
%x = r*sin(theta).*cos(phi);
%y = r*sin(theta).*sin(phi);
%z = r*cos(theta);

%plot3(x, y, z, '-b','linewidth', 2)
%grid on;
%axis equal;
%title('Esfera', 'fontsize', 20)
%xlabel('x', 'fontsize', 15)
%ylabel('y', 'fontsize', 15)
%zlabel('z', 'fontsize', 15)

%print -djpeg -r100 esfera.jpeg

"""Gráfica en polares, cardiodie."""

%t = 0:0.01:2*pi;
%polar(t, 2*(1 - cos(t)))

"""Gráfica 3D con surf."""

%x = -8:0.1:10;
%y = 0:0.1:1;
%[X, Y] = meshgrid(x, y); % genera las coordenadas de la region
%Z = sech(X + Y).^2 + sech(X + 20*Y - 5).^2;

%figure(1); clf;
%surf(X,Y,Z)
%shading interp;
%colormap(winter)
%az = 30; e1 = 45;
%view(az, e1)

%figure(2);clf;
%contour(X, Y, Z)

%figure(3); clf;

%subplot(1,2,1)
%surf(X,Y,Z)

%subplot(1, 2, 2)
%contour(X, Y, Z)

"""Ecuacion diferencial."""

% dy/dx = x²/(1 - y²)
% con solución x³ -3y + y³ = c

%x = -4:0.25:4;
%y = x;

%[X, Y] = meshgrid(x, y);

%dY = X.^2./(1 - Y.^2);
%dX = ones(size(dY));

%L = sqrt(1 + dY.^2); % Todos los vectores con longitud 1

%quiver(X, Y, dX./L, dY./L, 0.5) % plot para campos vectoriales
%hold on;
%contour(X, Y, X.^3 - 3*Y + Y.^3, -4:1:4, 'r')
%hold off;
%grid on;
%axis([-4 4 -4 4])
%title('Campo vectorial')


"""Campo electrico y magentico."""

x = -5:0.25:5;
y = x;

[X, Y] = meshgrid(x, y);

Ex = X./ (X.^2 + Y.^2);
Ey = Y./ (X.^2 + Y.^2);

Bx = -Y./ (X.^2 + Y.^2);
By = X./ (X.^2 + Y.^2);

L1 = sqrt(Ex.^2 + Ey.^2);
L2 = sqrt(Bx.^2 + By.^2);

figure(1); clf;
quiver(X, Y, Ex./L1, Ey./L1);

figure(2); clf;
quiver(X, Y, Bx./L2, By./L2);

% Tarea hacer el campo de un dipolo

