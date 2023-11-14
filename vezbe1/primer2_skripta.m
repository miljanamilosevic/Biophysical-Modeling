tspan = [0 25];
x0 = 1;
T = 5;
b = 1;
a = -1/T;
param = [a b];
[t,x]  = ode45(@primer2,tspan,x0,[],param);
plot(t,x,'red','linewidth',2.5);
xlabel('t');
ylabel('x');
title('resenje');

hold on

%Ojlerova metoda - nema fje, sve sami radimo
tmax = 25; %vreme do kog se izvrsavaju simulacije
dt = 0.1; %vremenski korak odredjivanja resenja (delta t)
Nt = tmax/dt; %broj tacaka u kojima se odredjuje resenje
tspan = 0:dt:tmax; %vremenski opseg sa diskretnim koracima
x = zeros(size(tspan)); %inicijalizacija vektora resenja
%T = 5;
%b = 1;
%a = -1/T; - vec je zapisano gore pa ne mora
x(1) = 1; %pocetni uslov
for t = 1:Nt
    x(t+1) = x(t) + dt*(a*x(t)+b); %resavanje jednacine modela za x
end
plot(tspan,x,'.blue','linewidth',0.25);
