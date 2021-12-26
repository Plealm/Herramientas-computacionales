function dy = fmotProy(t, y, m, b)
  dy = zeros(4, 1);
  g = 9.81;
  dy(1) = y(2);
  dy(2) = -(b/m)*y(2);
  dy(3) = y(4);
  dy(4) = -g -(b/m)*y(4);
endfunction
