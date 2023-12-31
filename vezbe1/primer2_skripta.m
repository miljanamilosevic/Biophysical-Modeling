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
title('Re�enje');

hold on

%Ojlerova metoda - nema f-je, sve sami radimo
%(x u nekoj tacki (tn+1) i x(tn))/delta t = a*x(tn)+b
tmax = 25; %vreme do kog se izvrsavaju simulacije
dt = 0.1; %vremenski korak odredjivanja resenja (delta t) - delta t je rastojanje izmedju dve tacke (0-25),
% u koliko tacaka cemo traziti resenje zavisi od delta t, npr ako je dt=1
% imali bismo 25 tacaka, ako je 0.1 imali bismo 250 itd. 
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
