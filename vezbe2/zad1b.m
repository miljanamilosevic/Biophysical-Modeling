function dV = zad1b(t,V,param)
R = param(1);
Ek = param(2);
tau = param(3);
I0 = param(4);
T1 = param(5);
T2 = param(6);
Iapp = I0.*(t>=T1 & t<=T2);
dV = (Ek+R*Iapp-V)/tau;
end
