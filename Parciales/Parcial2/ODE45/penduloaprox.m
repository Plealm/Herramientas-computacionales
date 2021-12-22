function dy = penduloaprox(t, y, m1, m2, L1, L2, g)
% Sistemas de ecuaciones con 
% aproximación de pequeñas oscilaciones

m = m1/m2; 

% Definición del vector del sistema de EDO
dy=zeros(4,1);

dy=zeros(4,1);

dy(1)=y(2);

dy(2)=((g*(y(3))/L1-y(2)*y(2)*(y(1)-y(3)))...
-(L2/L1)*((m+1)*g*(y(1))/L2+y(4)*y(4)*(y(1)-y(3))))...
/(m+(y(1)-y(3))*(y(1)-y(3)));

dy(3)=y(4);

dy(4)=(((m+1)*g*(y(1))/L2+y(4)*y(4)*(y(1)-y(3)))...
-(m+1)*(L1/L2)*(g*(y(3))/L1-y(2)*y(2)*(y(1)-y(3))))...
/(m+(y(1)-y(3))*(y(1)-y(3)));
end