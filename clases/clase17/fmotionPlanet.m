function dy = fmotionPlanet(t, y)
  
  dy = zeros(4, 1);
  dy(1) = y(2);
  dy(2) = -4*pi^2*y(1)/(y(1)^2 + y(3)^2)^(3/2);
  dy(3) = y(4);
  dy(4) = -4*pi^2*y(3)/(y(1)^2 + y(3)^2)^(3/2);
endfunction
