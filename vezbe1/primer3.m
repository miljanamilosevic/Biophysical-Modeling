tspan = [0 1];
n0 = 100;
b = 1/0.5;  %b=1bakterija/30minuta=1bakterija/0.5h
p = 0.5;
param = [b p];
[t,n]  = ode45(@bacteria,tspan,n0,[],param);
plot(t,n,'red','linewidth',2.5);
xlabel('Vreme [h]');
ylabel('Broj bakterija');
title('Resenje');
fprintf('%3.0f',n(end));
hold on

%Ojlerova
Tmax = 1; %vreme do kog se izvrsavaju simulacije
dt = 0.01; %vremenski korak odredjivanja resenja
Nt = Tmax/dt; %broj tacaka u kojima se odredjuje resenje
Tspan = 0:dt:Tmax; %vremenski opseg sa diskretnim koracima
n = zeros(size(Tspan)); %inicijalizacija vektora resenja
n(1) = 100;
for t = 1:Nt
    n(t+1) = n(t) + dt*(b*n(t)-p*n(t)^2); %resavanje jednacine modela za n
end
plot(Tspan,n,'.blue','linewidth',0.25);
fprintf('%3.0f',n(Nt));
