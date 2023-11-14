tspan = [0 5];
w0 = 1;
[t,w]  = ode23(@primer1,tspan,w0);
plot(t,w);
xlabel('t');
ylabel('w');
title('resenje');