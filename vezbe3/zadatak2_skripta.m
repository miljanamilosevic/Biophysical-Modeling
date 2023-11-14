R = 5*10^(-6);
ro_membrana = 0.2;
ro_omotac = 0*75;
ro_aksoplazma = 2;
eps_r = 5;
d = 5*10^(-9);
n = 100;

%parametri za nemijeliziran
ra1 = ro_aksoplazma/(pi*R^2);
rm1 = ro_membrana/(2*pi*R);
cm1 = (eps_r*8.85*10^(-12)*2*pi*R)/d;
lambda1 = sqrt(rm1/ra1);
tau1 = rm1*cm1;

%parametri za mijeliziran
ra2 = ro_aksoplazma/(pi*R^2);
rm2 = ro_omotac/(2*pi*R);
cm2 = (eps_r*8.85*10^(-12)*2*pi*R)/(n*d);
lambda2 = sqrt(rm2/ra2);
tau2 = rm2*cm2;

V0 = 0.1; %amplituda akcionog potencijala
xspan = [0 15*10^(-3)];

%nemijeliziran akson
V01 = [V0; -V0/lambda1];
param1 = [ra1,rm1];
[x1,V1] = ode45(@zad2,xspan,V01,[],param1);

%mijeliziran akson
V02 = [V0; -V0/lambda2];
param2 = [ra2,rm2];
[x2,V2] = ode45(@zad2,xspan,V02,[],param2);

plot(x1*10^3,V1(:,1)*10^3,'linewidth',2);
ylim([-20 100]);
hold on
plot(x2*10^3,V2(:,1)*10^3,'linewidth',2);
xlabel('rastojanje od mesta generisanja akcionog potencijala [mm]');
ylabel('potencijal [mV]');
legend('nemijeliziran akson', 'mijeliziran akson');
