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
    % Coordenadas 
    z = (vt/g)*(v0z + vt)*(1 - exp(-(g/vt)*t)) - vt*t;
    x = (vt*v0x/g)*(1 - exp(-(g/vt)*t));
    y = x;
   
    alturamax = z(1);
    for ii = 2:size(t, 2)
      if z(ii) > alturamax 
         alturamax = z(ii);
      endif
    endfor
    
    j = 1;
    while z(j) >= 0
      j = j + 1;
    endwhile
    
    Xmax = x(j);
    tmax1 = t(j);
    t1 = 0:0.01:t(j);
    z1 = (vt/g)*(v0z + vt)*(1 - exp(-(g/vt)*t1)) - vt*t1;
    x1 = (vt*v0x/g)*(1 - exp(-(g/vt)*t1));
    y1 = x1;
    
    fprintf('\nPara el coeficiente de arrastre c = %.2f\n', c)
    fprintf('El tiempo máximo es tmax = %.2f s\n', tmax1)
    fprintf('La distancia máxima es Xmax = %.2f m\n', Xmax)
    fprintf('La altura maxima es hmax = %.2f m\n', alturamax)
    
    figure(i);clf;
    h = plot3(x1, y1, z1,'b.');
    view(10,35);
    grid on;
    caption = sprintf('Movimiento parabolico con c = %.2f y θ = %.2f',c, theta);
    title(caption, 'Fontsize', 20);
    xlabel('X [m]', 'Fontsize', 15);
    ylabel('Y [m]', 'Fontsize', 15);
    zlabel('Z [m]', 'Fontsize', 15);
    saveas(h,sprintf('FIG%d.png', i));
end
