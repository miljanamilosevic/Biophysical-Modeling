tspan = [0 5];  %vremenski interval
w0 = 1;  %pocetni uslov
[t,w]  = ode23(@primer1,tspan,w0);
plot(t,w);
xlabel('t');
ylabel('w');
title('resenje');