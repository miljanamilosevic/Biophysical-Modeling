tspan = [-1 1];
y0 = [1; 1];
[t,y] = ode45(@primer5, tspan, y0);

plot(t, y, 'linewidth', 1.5);
title('Resenje sistema: dy/dt=x i dx/dy=-y');
legend('y', 'x');
