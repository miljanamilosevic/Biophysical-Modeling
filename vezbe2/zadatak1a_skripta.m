R = 199*10^6;  %1.5*ova vrednost - ako hocemo da povecamo za pedeset posto
C = 59*10^(-12);
tau = R*C;
Ek = -95*10^(-3);

%kola sa L, C i R, prelazni procesi se dese za 3-5 tau
tspan = [0 5*tau];  

%3 pocetna uslova za 3 slucaja
% Vm>Ek, Vm<Ek, Vm=Ek
%ima smisla da se razlikuju za 100nak
Vm01 = 15*10^(-3); %Vm>Ek
Vm02 = -190*10^(-3); %Vm<Ek
Vm03 = Ek;
param = [tau Ek];
[t,V] = ode45(@zad1a,tspan,Vm01,[],param);
plot(t*10^3,V*10^3)
hold on;
[t,V] = ode45(@zad1a,tspan,Vm02,[],param);
plot(t*10^3,V*10^3)
[t,V] = ode45(@zad1a,tspan,Vm03,[],param);
plot(t*10^3,V*10^3)
legend('Vm>Ek','Vm<Ek','Vm=Ek')
xlabel('vreme [ms]');
ylabel('membranski potencijal [mV]');
title('model celijske membrane');