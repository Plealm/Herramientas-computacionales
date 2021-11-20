  % Punto 2 Parcial 1 por verlet
  clear;clc;
  %%%%%%%%%%%%%%%%%%%%% constantes del problema %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  g = 9.81; 
  m = 2;
  b = input('Ingrese el valor de la resistencia del aire: ');
  tf = 20;
  dt = 0.005;
  t = 0:dt:tf;
  N = length(t);
  v0 = input('Escriba la velocidad inical de la particula: ');
  theta = 60;
  v0y = v0*sin(theta*pi/180);
  v0x = v0*cos(theta*pi/180);
  %%%%%%%%%%%%%%%%%%%%% Condiciones inicales %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  x(1) = 0;
  vx(1) = v0x;
  y(1) = 0;
  vy(1) = v0y;
  
  %%%%%%%%%%% Funciones para realizar mas comodo el bucle %%%%%%%%%%%%%%%%%%%%
  
  fax= @(vx,vy) ((-b/m).*(vx).*sqrt((vx.^2)+(vy.^2)));
  fay= @(vx,vy) (-g -(b/m).*(vy).*sqrt((vx.^2)+(vy.^2)));
  
  %%%%%%%%%%%%%%%%%%%%% Primer aumento %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  x(2) = x(1)+vx(1)*dt;
  y(2) = y(1)+vy(1)*dt;
  vx(2)=vx(1)+fax(vx(1),vy(1))*dt;
  vy(2)=vy(1)+fay(vx(1),vy(1))*dt;
  
  %%%%%%%%%%%%%%%%%%% Caso Ideal %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  ta = 0:dt:tf;
  
  xa = v0x*ta;
  ya = v0y*ta - (g*ta.^2)/2;
  vya = v0y - g*ta;  
  vxa =  v0x;
  axa = 0;
  aya= g;
  
  %%%%%%%%%%%%%%%%%% Bucle de Verlet %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  for n=3:N
    
  % Implementación del metodo de Verlet
  x(n) =2*x(n-1)-x(n-2)+ dt*dt*(fax(vx(n-1),vy(n-1)));
  y(n) =2*y(n-1)-y(n-2)+ dt*dt*(fay(vx(n-1),vy(n-1)));
  vx(n) = (x(n)-x(n-2))/(2*dt);
  vy(n) = (y(n)-y(n-2))/(2*dt);
  
  % Se encuentran las aceleraciones
  ax(n) = (vx(n)-vx(n-2))/(2*dt);
  ay(n) = (vy(n)-vy(n-2))/(2*dt);
  endfor
  
  vx(N) = (x(N)-x(N-1))/dt;
  vy(N) = (y(N)-y(N-1))/dt;
  
  %%%%%%%%%%%%%%%%%%%%%%%%%% Graficas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  
  % Grafica de x vs t 
  figure(1);clf;
  plot(t, x,'k-','lineWidth', 3, ta, xa,'b-','lineWidth', 3);grid on;
  caption = sprintf('Posición en x con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
  title(caption);
  xlabel('t[s]');
  ylabel('Distancia[m]');
  legend('Solucion por Verlet', 'Caso ideal'); 
  axis([0 5 0 100])
  saveas (1, "verlet_xt.png");
  
  % Grafica de y vs t
  figure(2);clf;
  plot(t, y,'k-','lineWidth', 3, ta, ya,'b-','lineWidth', 3);grid on;
  caption1 = sprintf('Posición en y con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
  title(caption1);
  xlabel('t[s]');
  ylabel('Distancia[m]');
  legend('Solucion por verlet', 'Caso ideal'); 
  axis([0 15 0 100])
  saveas (2, "verlet_yt.png");
  
  % Grafica de vx vs t
  figure(3);clf;
  plot(t, vx,'k-','lineWidth', 3);grid on;hold on;
  line ([0 20], [vxa vxa], "linestyle", "-", "color", "b",'lineWidth', 3);
  caption2 = sprintf('Velocidad en x con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
  title(caption2);
  xlabel('t[s]');
  ylabel('velocidad [m/s]');
  legend('Solucion por verlet', 'Caso Ideal'); 
  saveas (3, "verlet_vxt.png");
  
  % Grafica de vy vs t
  figure(4);clf;
  plot(t, vy,'k-','lineWidth', 3, ta, vya,'b-','lineWidth', 3);grid on;
  caption3 = sprintf('Velocidad en y con respecto al tiempo para un arrastre b = %d y  v0 = %d', b, v0);
  title(caption3);
  xlabel('t[s]');
  ylabel('velocidad [m/s]');
  legend('Solucion por verlet', 'Caso ideal'); 
  axis([0 5 -10 50])
  saveas (4, "verlet_vyt.png");
  
  % Grafica de la trayectoria x y
  figure(5);clf;
  plot(x, y,'k-','lineWidth', 3, xa, ya,'b-','lineWidth', 3);grid on;
  caption4 = sprintf('Trayectoria para un arrastre b = %d y  v0 = %d', b, v0);
  title(caption4);
  xlabel('x[m]');
  ylabel('y[m]');
  legend('Solucion por verlet', 'Caso ideal'); 
  axis([0 180 0 200])
  saveas (5, "verlet_xy.png");
  
  % Grafica de la aceleración en x
  figure(6);clf;
  plot(t, ax,'k-','lineWidth', 2);grid on;hold on;
  line ([0 20], [axa axa], "linestyle", "-", "color", "b",'lineWidth', 3);
  caption5 = sprintf('aceleraciones en x para un arrastre b = %d y  v0 = %d', b, v0);
  title(caption5);
  xlabel('t[s]');
  ylabel('aceleración [m/s²]');
  legend('Solución por euler-modificado', 'Caso ideal'); 
  saveas (6, "verlet_axt.png");
  
  % Grafica de la aceleración en y
  figure(7);clf;
  plot(t, ay,'k-','lineWidth', 2);grid on;hold on;
  line ([0 20], [aya aya], "linestyle", "-", "color", "b",'lineWidth', 3);
  caption6 = sprintf('aceleraciones en y para un arrastre b = %d y  v0 = %d', b, v0);
  title(caption6);
  xlabel('t[s]');
  ylabel('aceleración [m/s²]');
  legend('Solución por euler-modificado', 'Caso ideal'); 
  saveas (7, "verlet_ayt.png");
  
  
  
  
  
  
