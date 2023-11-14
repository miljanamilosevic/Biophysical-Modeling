R = 0.75*199*10^6;
C = 59*10^(-12);
tau = R*C;
Ek = -95*10^(-3);
I0 = 10^(-9);
T1 = 10*10^(-3);
T2 = 70*10^(-3);

%ovde 0-5tau nije dovoljno, T2-T1=5*tau u ovom slucaju
%treba bar 11-12tau
tspan = [0 12*tau];
param = [R Ek tau I0 T1 T2];
%membr je u stanju ravnoteze => Vm=Ek
[t,V] = ode45(@zad1b,tspan,Ek,[],param);
Iapp = I0.*(t>=T1 & t<=T2);
subplot(2,1,1);
plot(t*10^3,Iapp*10^9,'linewidth',1.5);
ylim([-0.1 1.2]);
xlabel('vreme [ms]');
ylabel('struja stimulansa [nA]');
title('pobudni impuls');
subplot(2,1,2);
plot(t*10^3,V*10^3,'linewidth',1.5);
xlabel('vreme [ms]');
ylabel('membranski potencijal [mV]');
title('odziv celijske membrane na pobudu');