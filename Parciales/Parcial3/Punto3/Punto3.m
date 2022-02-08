% Tercer Parcial
% Punto 3
clear all; close all; clc;
numy=41;numt=41;dy=1/(numy-1);dt=0.001;y=0:dy:1;
iimag = sqrt(-1);
a1 = 5; a2 = 7*iimag;

u=zeros(numy,numt);
w=zeros(numy,numt);

u(1,1)=0; u(numy,1)=0;
w(1,1)=0; w(numy,1)=0;

for i=2:numy-1;
u(i,1)= cos(y(i)); %Condicion temporal
w(i,1)= exp(-y(i)^2); %Condicion temporal
endfor
t(1) = 0;

for j=1:numt
t(j+1)=t(j)+dt;
for i=2:numy-1
u(i,j+1)=u(i,j)-((dt/iimag)*(a1*w(i,j) + (u(i+1,j) - 2*u(i,j) + u(i-1,j))/dy));
w(i,j+1)=w(i,j)-((dt/iimag)*(a2*u(i,j) + (w(i+1,j) - 2*w(i,j) + w(i-1,j))/dy));
endfor
endfor
%%%%%%%%
figure(1);clf;
for k=1:numt
plot(y,real(u(:,k)),'linewidth',2);
grid on; hold on; title('Evolucion temporal de la parte real u(y,t)');
ylabel('y');ylabel('u(y)');
drawnow
endfor
print -dpng ureal.png;
figure(2);clf;
for k=1:numt
plot(y,real(w(:,k)),'linewidth',2);
grid on; hold on; title('Evolucion temporal de la parte real w(y,t)');
ylabel('y');ylabel('w(y)');
drawnow
endfor
print -dpng wreal.png;
figure(3);clf;
for k=1:numt
plot(y,imag(u(:,k)),'linewidth',2);
grid on; hold on; title('Evolucion temporal de la parte imaginaria u(y,t)');
ylabel('y');ylabel('u(y)');
drawnow
endfor
print -dpng uimg.png;
figure(4);clf;
for k=1:numt
plot(y,imag(w(:,k)),'linewidth',2);
grid on; hold on; title('Evolucion temporal de la parte imaginaria w(y,t)');
ylabel('y');ylabel('w(y)');
drawnow
endfor
print -dpng wimg.png;
figure(5);clf;
[Y,T]=meshgrid(y,t);
colormap jet;
surf(Y,T,real(u'));ylabel('y');ylabel('t');
zlabel('Parte real u(y,t)'); view(330,30);
print -dpng ureal2.png;
figure(6);clf;
colormap jet;
surf(Y,T,real(w'));ylabel('y');ylabel('t');
zlabel('Parte real w(y,t)'); view(330,30);
print -dpng wreal2.png;
figure(7);clf;
colormap winter;
surf(Y,T,imag(u'));ylabel('y');ylabel('t');
zlabel('Parte imaginaria de u(y,t)'); view(330,30);
print -dpng uimg2.png;
figure(8);clf;
colormap winter;
surf(Y,T,imag(w'));ylabel('y');ylabel('t');
zlabel('Parte imaginaria de w(y,t)'); view(330,30);
print -dpng wimg2.png;