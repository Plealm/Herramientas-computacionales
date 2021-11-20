% Punto 2 Parcial 1 por valor medio
clear;clc;

%%%%%%%%%%%%%%%%%%%%% constantes del problema %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
g = 9.81; 
m = 2;
b = input('Ingrese el valor de la resistencia del aire: ');
tf = 20;
N = 5000;
dt = tf/N;
v0 = input('Escriba la velocidad inical de la particula: ');
theta = 60;
v0y = v0*sin(theta*pi/180);
v0x = v0*cos(theta*pi/180);
%%%%%%%%%%%%%%%%%%%%% Condiciones inicales %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
t(1) = 0;
x(1) = 0;
vx(1) = v0x;
y(1) = 0;
vy(1) = v0y;
%%%%%%%%%%%%%%%%%%% Caso Ideal %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
ta = 0:dt:tf;

xa = v0x*ta;
ya = v0y*ta - (g*ta.^2)/2;
vya = v0y - g*ta;  
vxa =  v0x;
axa = 0;
aya= g;
%%%%%%%%%%%%%%%%%% Bucle de valor medio %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n = 1:N
  t(n+1) = n*dt;  % incremento para t
  
  % Busqueda del punto medio
  xhalf = x(n) + vx(n)*(dt/2);
  yhalf = y(n) + vy(n)*(dt/2);
  vxhalf = vx(n) -(b/m)*vx(n)*sqrt(vx(n).^2 + vy(n).^2)*(dt/2);
  vyhalf=vy(n) - (g+(b/m)*vy(n)*sqrt(vx(n).^2 + vy(n).^2))*dt*.5;
  
  % Utilización del algoritmo con el punto medio
  x(n+1) = x(n) + vxhalf*(dt);
  y(n+1) = y(n) + vyhalf*(dt);
  vx(n+1) = vx(n) -(b/m)*vxhalf*sqrt(vxhalf.^2 + vyhalf.^2)*(dt);
  vy(n+1)= vy(n) - (g+(b/m)*vyhalf*sqrt(vxhalf.^2 + vyhalf.^2))*dt;
  
  % Se encuentran las aceleraciones
  
  ax(n+1) = -(b/m)*vx(n)*sqrt(vx(n).^2 + vy(n).^2);
  ay(n+1) = -(g + (b/m)*vy(n)*sqrt(vx(n).^2 + vy(n).^2));
endfor
%%%%%%%%%%%%%%%%%%%%%%%%%% Graficas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Grafica de x vs t 
figure(1);clf;
plot(t, x,'r-','lineWidth', 3, ta, xa,'b-','lineWidth', 3);grid on;
caption = sprintf('Posición en x con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
title(caption);
xlabel('t[s]');
ylabel('Distancia[m]');
legend('Solucion por valor medio', 'Caso ideal'); 
axis([0 5 0 100])
saveas (1, "valor_xt.png");

% Grafica de y vs t
figure(2);clf;
plot(t, y,'r-','lineWidth', 3, ta, ya,'b-','lineWidth', 3);grid on;
caption1 = sprintf('Posición en y con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
title(caption1);
xlabel('t[s]');
ylabel('Distancia[m]');
legend('Solucion por valor medio', 'Caso ideal'); 
axis([0 15 0 100])
saveas (2, "valor_yt.png");

% Grafica de vx vs t
figure(3);clf;
plot(t, vx,'r-','lineWidth', 3);grid on;hold on;
line ([0 20], [vxa vxa], "linestyle", "-", "color", "b",'lineWidth', 3);
caption2 = sprintf('Velocidad en x con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
title(caption2);
xlabel('t[s]');
ylabel('velocidad [m/s]');
legend('Solucion por valor medio', 'Caso Ideal'); 
saveas (3, "valor_vxt.png");

% Grafica de vy vs t
figure(4);clf;
plot(t, vy,'r-','lineWidth', 3, ta, vya,'b-','lineWidth', 3);grid on;
caption3 = sprintf('Velocidad en y con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
title(caption3);
xlabel('t[s]');
ylabel('velocidad [m/s]');
legend('Solucion por valor medio', 'Caso ideal'); 
axis([0 5 -10 50])
saveas (4, "valor_vyt.png");

% Grafica de la trayectoria x y
figure(5);clf;
plot(x, y,'r-','lineWidth', 3, xa, ya,'b-','lineWidth', 3);grid on;
caption4 = sprintf('Trayectoria para un arrastre b = %d y  v0 = %d', b, v0);
title(caption4);
xlabel('x[m]');
ylabel('y[m]');
legend('Solucion por valor medio', 'Caso ideal'); 
axis([0 180 0 200])
saveas (5, "valor_xy.png");

% Grafica de la aceleración en x
figure(6);clf;
plot(t, ax,'r-','lineWidth', 2);grid on;hold on;
line ([0 20], [axa axa], "linestyle", "-", "color", "b",'lineWidth', 3);
caption5 = sprintf('aceleraciones en x para un arrastre b = %d y  v0 = %d', b, v0);
title(caption5);
xlabel('t[s]');
ylabel('aceleración [m/s²]');
legend('Solución por valor medio', 'Caso ideal'); 
saveas (6, "valor_axt.png");

% Grafica de la aceleración en y
figure(7);clf;
plot(t, ay,'r-','lineWidth', 2);grid on;hold on;
line ([0 20], [aya aya], "linestyle", "-", "color", "b",'lineWidth', 3);
caption6 = sprintf('aceleraciones en y para un arrastre b = %d y  v0 = %d', b, v0);
title(caption6);
xlabel('t[s]');
ylabel('aceleración [m/s²]');
legend('Solución por valor medio', 'Caso ideal'); 
saveas (7, "valor_ayt.png");