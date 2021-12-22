function dy = pendulo(t, y, m1, m2, L1, L2, g)
% Sistemas de ecuaciones sin paroximación.

m = m1/m2; 
% definición del vector del sistema de EDO
dy=zeros(4,1);

dy(1)=y(2);

dy(2)=(cos(y(1)-y(3))*(g*sin(y(3))/L1-y(2)*y(2)*sin(y(1)-y(3)))...
-(L2/L1)*((m+1)*g*sin(y(1))/L2+y(4)*y(4)*sin(y(1)-y(3))))...
/(m+sin(y(1)-y(3))*sin(y(1)-y(3)));

dy(3)=y(4);

dy(4)=(cos(y(1)-y(3))*((m+1)*g*sin(y(1))/L2+y(4)*y(4)*sin(y(1)-y(3)))...
-(m+1)*(L1/L2)*(g*sin(y(3))/L1-y(2)*y(2)*sin(y(1)-y(3))))...
/(m+sin(y(1)-y(3))*sin(y(1)-y(3)));
end