% Tercer Parcial
% 2 Punto 
% Pedro Jose Leal

clear all; close all; clc; tic
%%%%%%%%%%%%%%%% Condiciones del método %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
L = 120; N = L + 2; h = 1/(L+1); 
a1 = 7.5; b1 = 1250; a2 = 2500; b2 = 450; 
x=0:h:1; y=0:h:1;
% Definición del las matrices U y W
U(N,N)=zeros; UNew(N,N)=zeros;
W(N,N)=zeros; WNew(N,N)=zeros;
%%%%%%%%%%%%%%%% Condiciones de frontera %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
for i=1:N 
  %lado izquierdo
  UNew(1,i) = 20*y(i)^5; 
  WNew(1,i) = cos(12*y(i)/pi - 50); 
  %lado derecho
  UNew(N,i) = cos(20*y(i)/pi);
  WNew(N,i) = cos(20*y(i)/pi);
  %abajo
  UNew(i,1) = 10*x(i)^2;
  WNew(i,1) = cos(2*x(i)/pi - 2);
  %arriba
  UNew(i,N) = 2*(5*x(i)^5 - 3); 
  WNew(i,N) = cos(20*x(i)/pi); 
endfor

steps = 0; accuracy = 0.1;
%%%%%%%%%%%%%%%% Diferencias Finitas %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
while true
  U=UNew; W=WNew;
  for i=2:N-1;
    for j=2:N-1;
      UNew(i,j)=0.25*(U(i-1,j)+U(i+1,j)+U(i,j-1)+U(i,j+1)-h^2*(a1*U(i,j)+b1*W(i,j)));
      WNew(i,j)=0.25*(W(i-1,j)+W(i+1,j)+W(i,j-1)+W(i,j+1)-h^2*(a2*U(i,j)+b2*W(i,j)));
    endfor
  endfor
  steps=steps+1;
  % Condición del error para mejor resultado
  error1=0; n=0; k=0; error2=0;
  for i=1:L+1
    for j=1:N-1
      if (UNew(i,j)~=0) && (UNew(i,j)~=U(i,j)) && (WNew(i,j)~=0) && (WNew(i,j)~=W(i,j))
        error1=error1+abs(1-U(i,j)/UNew(i,j));
        error2=error2+abs(1-U(i,j)/UNew(i,j));
        n=n+1; k=k+1;
      endif
    endfor
  endfor
%% Bucle del erro
  if n~=0
    error1=error1/n; error2=error2/n;
  endif
%% Condición para parar el while
  if(error1<accuracy) && (error2<accuracy)
    break
  endif
endwhile

%%%%%%%%%%%%%%%%% Graficación de los resultados %%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Solución para U
figure(1); clf; surf(U);colormap winter;
print -dpng U_poisson.png;
% Solución para W
figure(2); clf; surf(W);colormap winter;
print -dpng W_poisson.png;toc

