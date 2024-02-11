function f = neuron(t,x,Iapp)
ENa = 115;
EK = -12;
Eleak = 10.6;
gNamax = 120;
gKmax = 36;
gleak = 0.3;
Cm = 10^(-3);
n = x(1);
m = x(2);
h = x(3);
V = x(4);
alfa_n = (10-V)/(100*(exp((10-V)/10)-1));
beta_n = 0.125*exp(-V/80);
alfa_m = (25-V)/(10*(exp((25-V)/10)-1));
beta_m = 4*exp(-V/18);
alfa_h = 0.07*exp(-V/20);
beta_h = 1/(exp((30-V)/10)+1);
INa = gNamax*m.^3.*h*(V-ENa);
IK = gKmax*n.^4*(V-EK);
Ileak = gleak*(V-Eleak);
f(1,:) = alfa_n*(1-n)-beta_n*n;
f(2,:) = alfa_m*(1-m)-beta_m*m;
f(3,:) = alfa_h*(1-h)-beta_h*h;
f(4,:) = (Iapp-INa-IK-Ileak)/Cm;
end

