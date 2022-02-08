% Tercer Parcial
% 4 Punto Númerica

clear all; close all; clc;

N = 5e3;
d = input('Dimensión a analizar: ');
inside = 0;

for i =1:d
  a(1,i) = rand;
endfor

if d == 2
  t = linspace(0,2*pi);
  X = a(1)*cos(t); Y = a(2)*sin(t);
  figure(1); clf;
  plot(X, Y, '-r', 'LineWidth', 2); hold on;
  fn = fullfile("Montecarlo2.mp4");
  w = VideoWriter(fn);
  open(w);
  for jj = 1:N
    x = 2*a(1)*rand - a(1); y = 2*a(2)*rand - a(2);
    R = sqrt((x/a(1))^2 + (y/a(2))^2);
    if R <= 1
      inside += 1;
      titulo = ['Volumen elipse con semiejes : ', num2str(a(1)), ' y ', ...
   num2str(a(2))];
   title(titulo);
      plot(x, y, 'r.', 'Markersize', 15); grid on; drawnow
     else
      plot(x, y, 'b.', 'Markersize', 15); grid on; drawnow
    endif
    writeVideo (w, getframe (gcf));
  endfor
  close(w)
  print -dpng -r100 MonteCarlo2.png ;
endif

if d == 3
  [X, Y, Z] = ellipsoid(0, 0, 0,a(1), a(2), a(3));
  figure(1); clf;
  surf(X, Y, Z,'FaceColor','r', 'FaceAlpha', .1, 'EdgeAlpha', .3);
  hold on;
  fn = fullfile("Montecarlo3.mp4");
  w = VideoWriter(fn);
  open(w);
  for kk = 1:N
    x = 2*a(1)*rand - a(1); y = 2*a(2)*rand - a(2);
    z = 2*a(3)*rand - a(3); 
    R = sqrt((x/a(1))^2 + (y/a(2))^2 + (z/a(3))^2);
    if R <= 1
      inside += 1;
      titulo = ['Volumen elipse con semiejes : ', num2str(a(1)) , num2str(a(2)), ' y ', ...
   num2str(a(3))];
   title(titulo);
      plot3(x, y, z, 'r.', 'Markersize', 15); grid on; drawnow
     else
      plot3(x, y, z, 'b.', 'Markersize', 15); grid on; drawnow
    endif
    writeVideo (w, getframe (gcf));
  endfor
  close(w)
  print -dpng -r100 MonteCarlo3.png ;
endif

if d >=4 || d == 1
for j = 1:N
  x = rand(1, d);
  R = 0;
  for k = 1:d
    R += ((2*a(k)*x(k)-a(k))/(a(k)))^2;
  endfor
  r = sqrt(R);
  if r <= 1
    inside += 1;
  endif
endfor
endif

an = 1;
for ii = 1:d
  an *= a(ii);
endfor
format long
V = 2^d*an*(inside/N);
Vexact = an*pi^(d/2)*(1/(gamma((d/2)+1)));
error = 100*(abs(V- Vexact)/Vexact);
ejes = ['Los semiejes usados fueron :' , num2str(a)];
vol =[ 'Volumen calculado por Montecarlo: ' , num2str(V)];
vol1 = [ 'Volumen teórico: ' , num2str(Vexact)];
vol2 = ['El error porcentual es: ', num2str(error)];

disp('')
disp(ejes)
disp(vol)
disp(vol1)
disp(vol2)