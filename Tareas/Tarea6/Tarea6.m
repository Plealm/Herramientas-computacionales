% Pedro Leal
% Tarea 6

clc; clear;

g = 9.81;
m = 2;
t = 0:0.01:40;
theta = 65;
v0 = 10;
v0z = v0*sin(theta*pi/180);
v0x = v0*cos(theta*pi/180);
for i = 1:10
    c = 0.05*i;  % arrastre
    % Velocidad terminal
    vt = m*g/c;
    % Coordenadas con arrastre
    z = (vt/g)*(v0z + vt)*(1 - exp(-(g/vt)*t)) - vt*t;
    x = (vt*v0x/g)*(1 - exp(-(g/vt)*t));
    y = x;
    % Coordenadas sin arrastre
    X = v0x*t;
    Y = X;
    Z = v0z*t -0.5*g*t.^2;
    
    
    alturamax = z(1);
    Alturamax = Z(1);
    
    for ii = 2:size(t, 2)
      if z(ii) > alturamax 
         alturamax = z(ii);
      endif
    endfor
    for II = 2:size(t, 2)
      if Z(II) > Alturamax 
         Alturamax = Z(II);
      endif
    endfor
    
    j = 1;
    J = 1;
    while z(j) >= 0
      j = j + 1;
    endwhile
    while Z(J) >= 0
      J = J + 1;
    endwhile
    
    xmax = x(j);
    tmax1 = t(j);
    Xmax = X(J);
    Tmax1 = t(J);
    
    t1 = 0:0.01:t(j);
    z1 = (vt/g)*(v0z + vt)*(1 - exp(-(g/vt)*t1)) - vt*t1;
    x1 = (vt*v0x/g)*(1 - exp(-(g/vt)*t1));
    y1 = x1;
    
    T1 = 0:0.01:t(J);
    X1 = v0x*T1;
    Y1 = X1;
    Z1 = v0z*T1 -0.5*g*T1.^2;
    
    fprintf('\n Sin coeficiente de arrastre\n')
    fprintf('El tiempo máximo es tmax = %.2f s\n', Tmax1)
    fprintf('La distancia máxima es Xmax = %.2f m\n', Xmax)
    fprintf('La altura maxima es hmax = %.2f m\n', Alturamax)
    
    
    fprintf('\nPara el coeficiente de arrastre c = %.2f\n', c)
    fprintf('El tiempo máximo es tmax = %.2f s\n', tmax1)
    fprintf('La distancia máxima es Xmax = %.2f m\n', xmax)
    fprintf('La altura maxima es hmax = %.2f m\n', alturamax)
    
    figure(i);clf;
    plot3(x1, y1, z1,'b.', X1, Y1, Z1, 'r-');
    caption1 = sprintf('c = %.2f',c);
    legend(caption1, 'c = 0.00');
    view(10,35);
    grid on;
    caption = sprintf('Movimiento parabolico con v0 = %.2f y θ = %.2f',v0, theta);
    title(caption, 'Fontsize', 20);
    xlabel('X [m]', 'Fontsize', 15);
    ylabel('Y [m]', 'Fontsize', 15);
    zlabel('Z [m]', 'Fontsize', 15);
    filename = sprintf('Fig%d.png',i);
    saveas(gcf,filename)
end
