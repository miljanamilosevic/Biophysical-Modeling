gKmax = 36;
gNamax = 120;
tspan = [0:0.01:10];
%svi jonski kanali su zatvoreni
n0=0;
m0=0;
h0=1;
%cetiri slucaja za razlicite vrednosti potencijala
V1=20;
[t,n1] = ode45(@promenljiva_n, tspan, n0, [], V1);
[t,m1] = ode45(@promenljiva_m, tspan, m0, [], V1);
[t,h1] = ode45(@promenljiva_h, tspan, h0, [], V1);
gK1 = gKmax*n1.^4;
gNa1 = gNamax*m1.^3.*h1;

V2=40;
[t,n2] = ode45(@promenljiva_n, tspan, n0, [], V2);
[t,m2] = ode45(@promenljiva_m, tspan, m0, [], V2);
[t,h2] = ode45(@promenljiva_h, tspan, h0, [], V2);
gK2 = gKmax*n2.^4;
gNa2 = gNamax*m2.^3.*h2;

V3=60;
[t,n3] = ode45(@promenljiva_n, tspan, n0, [], V3);
[t,m3] = ode45(@promenljiva_m, tspan, m0, [], V3);
[t,h3] = ode45(@promenljiva_h, tspan, h0, [], V3);
gK3 = gKmax*n3.^4;
gNa3 = gNamax*m3.^3.*h3;

V4=100;
[t,n4] = ode45(@promenljiva_n, tspan, n0, [], V4);
[t,m4] = ode45(@promenljiva_m, tspan, m0, [], V4);
[t,h4] = ode45(@promenljiva_h, tspan, h0, [], V4);
gK4 = gKmax*n4.^4;
gNa4 = gNamax*m4.^3.*h4;

figure, plot(t,gK1);
hold on, plot(t,gK2);
plot(t,gK3);
plot(t,gK4);
ylabel('Provodnost [mS/cm^2]');
xlabel('Vreme [ms]');
title('Provodnost kalijumovih jonskih kanala');
legend('V=20 mV', 'V=40 mV', 'V=60 mV', 'V=100 mV');

figure, plot(t,gNa1);
hold on, plot(t,gNa2);
plot(t,gNa3);
plot(t,gNa4);
ylabel('Provodnost [mS/cm^2]');
xlabel('Vreme [ms]');
title('Provodnost natrijumovih jonskih kanala');
legend('V=20 mV', 'V=40 mV', 'V=60 mV', 'V=100 mV');

%Promena vrednosti aktivacionih promenljivih modela za npr. V=40 mV

figure, plot(t,n2);
hold on, plot(t,m2);
plot(t,h2);
ylabel('Vrednost aktivacione promenljive');
xlabel('Vreme [ms]');
title('Vrednost aktivacione promenljive');
legend('n', 'm', 'h');
