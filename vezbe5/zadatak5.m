Iapp = 7;
ENa = 115;
EK = -12;
Eleak = 10.6;
gNamax = 120;
gKmax = 36;
gleak = 0.3;
tspan = [0 75];
x0 = [0; 0; 1; -65];
[t,x] = ode45(@neuron,tspan,x0,[],Iapp);

%iscrtavanje akcionog potencijala
figure,plot(t,x(:,4));
title('Akcioni potencijal');
xlabel('Vreme [ms]');
ylabel('Membranski potencijal [mV]');
%xlim([-1 1.2]);

%Provodnosti jonskih kanala
gK = gKmax*x(:,1).^4;
gNa = gNamax*x(:,2).^3.*x(:,3);
figure,plot(t,gK)
hold on, plot(t,gNa)
title('Provodnost jonskih kanala');
xlabel('Vreme [ms]');
ylabel('Provodnost [mS/cm^2]');
legend('Kalijumovi jonski kanali', 'Natrijumovi jonski kanali');

%Struja jona
INa = gNa.*(x(:,4)-ENa);
IK = gK.*(x(:,4)-EK);
Ijona = INa + IK;
figure, plot(t,Ijona)
title('Jonske struje');
xlabel('Vreme [ms]');
ylabel('Struja jona [mA/cm^2]');
