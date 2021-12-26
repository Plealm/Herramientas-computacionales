function dy = fmotProyIdeal(t, y, m)
  dy = zeros(4, 1);
  g = 9.81;
  dy(1) = y(2);
  dy(2) = 0;
  dy(3) = y(4);
  dy(4) = -g;
endfunction
