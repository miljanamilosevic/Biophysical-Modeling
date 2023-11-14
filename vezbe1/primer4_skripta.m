tspan = [0 5];
x0 = [0 1];
[t,x]  = ode23(@primer4,tspan,x0);

plot(t,x(:,1),'red','linewidth',1); %resenje
hold on;
plot(t,x(:,2),'blue','linewidth',1); %prvi izvod resenja 

legend('resenje','prvi izvod resenja')