function dy = fmotionLorentz(t, y, p1, p2, p3)
  
  dy = zeros(3, 1);
  dy(1) = -p1*y(1) + p1*y(2);
  dy(2) = p3*y(1) - y(2) - y(1)*y(3);
  dy(3) = -p2*y(3) + y(1)*y(2);
  
endfunction
