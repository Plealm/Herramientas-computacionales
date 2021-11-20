% Punto 2 Parcial 1 por euler-modificado
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
%%%%%%%%%%% Funciones para realizar mas comodo el bucle %%%%%%%%%%%%%%%%%%%%

fx = @(t,x,y,vx,vy) vx;
fvx = @(t,x,y,vx,vy) - (b/m)*vx*sqrt(vx.^2 + vy.^2);
fy = @(t,x,y,vx,vy) vy;
fvy = @(t,x,y,vx,vy) - g - (b/m)*vy*sqrt(vx.^2 + vy.^2);

%%%%%%%%%%%%%%%%%% Bucle de Euler modificado %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

for n =1:N
t(n+1) = t(n) + dt; % incremento para t

% Definicion del nuevo punto base
xnew = x(n) + dt*fx(t(n),x(n),y(n),vx(n),vy(n));
ynew = y(n) + dt*fy(t(n),x(n),y(n),vx(n),vy(n));
vxnew = vx(n) + dt*fvx(t(n),x(n),y(n),vx(n),vy(n));
vynew = vy(n) + dt*fvy(t(n),x(n),y(n),vx(n),vy(n));

% Utilización del algoritmo euler modificado que toma un promedio
x(n+1) = x(n) + (dt/2)*(fx(t(n),x(n),y(n),vx(n),vy(n)) + fx(t(n+1),xnew,ynew,vxnew,vynew));
y(n+1) = y(n) + (dt/2)*(fy(t(n),x(n),y(n),vx(n),vy(n)) + fy(t(n+1),xnew,ynew,vxnew,vynew));
vx(n+1) = vx(n) + (dt/2)*(fvx(t(n),x(n),y(n),vx(n),vy(n)) + fvx(t(n+1),xnew,ynew,vxnew,vynew));
vy(n+1) = vy(n) + (dt/2)*(fvy(t(n),x(n),y(n),vx(n),vy(n)) + fvy(t(n+1),xnew,ynew,vxnew,vynew));

% Se encuentran las aceleraciones

ax(n+1) = (vx(n+1)-vx(n))/dt;
ay(n+1) = (vy(n+1)-vy(n))/dt;
endfor
%%%%%%%%%%%%%%%%%%%%%%%%%% Graficas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% Grafica de x vs t 
figure(1);clf;
plot(t, x,'g-','lineWidth', 3, ta, xa,'b-','lineWidth', 3);grid on;
caption = sprintf('Posición en x con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
title(caption);
xlabel('t[s]');
ylabel('Distancia[m]');
legend('Solucion por euler-modificado', 'Caso ideal'); 
axis([0 5 0 100])
saveas (1, "Euler_xt.png");

% Grafica de y vs t
figure(2);clf;
plot(t, y,'g-','lineWidth', 3, ta, ya,'b-','lineWidth', 3);grid on;
caption1 = sprintf('Posición en y con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
title(caption1);
xlabel('t[s]');
ylabel('Distancia[m]');
legend('Solucion por euler-modificado', 'Caso ideal'); 
axis([0 15 0 100])
saveas (2, "Euler_yt.png");

% Grafica de vx vs t
figure(3);clf;
plot(t, vx,'g-','lineWidth', 3);grid on;hold on;
line ([0 20], [vxa vxa], "linestyle", "-", "color", "b",'lineWidth', 3);
caption2 = sprintf('Velocidad en x con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
title(caption2);
xlabel('t[s]');
ylabel('velocidad [m/s]');
legend('Solucion por euler-modificado', 'Caso Ideal'); 
saveas (3, "Euler_vxt.png");

% Grafica de vy vs t
figure(4);clf;
plot(t, vy,'g-','lineWidth', 3, ta, vya,'b-','lineWidth', 3);grid on;
caption3 = sprintf('Velocidad en y con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
title(caption3);
xlabel('t[s]');
ylabel('velocidad [m/s]');
legend('Solucion por euler-modificado', 'Caso ideal'); 
axis([0 5 -10 50])
saveas (4, "Euler_vyt.png");

% Grafica de la trayectoria x y
figure(5);clf;
plot(x, y,'g-','lineWidth', 3, xa, ya,'b-','lineWidth', 3);grid on;
caption4 = sprintf('Trayectoria para un arrastre b = %d y  v0 = %d', b, v0);
title(caption4);
xlabel('x[m]');
ylabel('y[m]');
legend('Solucion por euler-modificado', 'Caso ideal'); 
axis([0 180 0 200])
saveas (5, "Euler_xy.png");

% Grafica de la aceleración en x
figure(6);clf;
plot(t, ax,'g-','lineWidth', 2);grid on;hold on;
line ([0 20], [axa axa], "linestyle", "-", "color", "b",'lineWidth', 3);
caption5 = sprintf('aceleraciones en x para un arrastre b = %d y  v0 = %d', b, v0);
title(caption5);
xlabel('t[s]');
ylabel('aceleración [m/s²]');
legend('Solución por euler-modificado', 'Caso ideal'); 
saveas (6, "Euler_axt.png");

% Grafica de la aceleración en y
figure(7);clf;
plot(t, ay,'g-','lineWidth', 2);grid on;hold on;
line ([0 20], [aya aya], "linestyle", "-", "color", "b",'lineWidth', 3);
caption6 = sprintf('aceleraciones en y para un arrastre b = %d y  v0 = %d', b, v0);
title(caption6);
xlabel('t[s]');
ylabel('aceleración [m/s²]');
legend('Solución por euler-modificado', 'Caso ideal'); 
saveas (7, "Euler_ayt.png");






