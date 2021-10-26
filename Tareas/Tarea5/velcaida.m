% Tarea la misma función para diferentes c
function v = velcaida(m, t)
  g = 9.8;
  t1 = 0:0.05:t;
  for i = 1:10
    c = 0.1*i
    v = (m*g/c)*(1 - exp((-c/m)*t1));
    figure(i);clf;
    h = plot(t1, v,'b-');
    grid on;
    caption = sprintf('Velocidad dependiente del factor c = %.2f',c );
    title(caption, 'Fontsize', 20);
    xlabel('tiempo [s]', 'Fontsize', 15);
    ylabel('Velocidad[m/s]', 'Fontsize', 15);
    axis([0 120 0 200]);
    saveas(h,sprintf('FIG%d.png',i));
    end
endfunction

