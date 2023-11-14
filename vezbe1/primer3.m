tspan = [0 1];
n0 = 100;
b = 1/0.5;
p = 0.5;
param = [b p];
[t,n]  = ode45(@bakterija,tspan,n0,[],param);
plot(t,n,'red','linewidth',2.5);
xlabel('vreme [h]');
ylabel('broj bakterija');
title('resenje');
fprintf('%3.0f',n(end));
hold on

%Ojlerova
Tmax = 1;
dt = 0.01;
Nt = Tmax/dt; 
Tspan = 0:dt:Tmax; 
n = zeros(size(Tspan));
n(1) = 100;
for t = 1:Nt
    n(t+1) = n(t) + dt*(b*n(t)-p*n(t)^2);
end
plot(Tspan,n,'.blue','linewidth',0.25);
fprintf('%3.0f',n(Nt));
