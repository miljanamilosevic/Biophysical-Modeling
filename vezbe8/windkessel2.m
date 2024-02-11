function dV = windkessel2(t, V, param1)
Tc = param1(1);
Ts = param1(2);
n = param1(3);
I0= param1(4);
R = param1(5);
C = param1(6);
sinus = @(t)sin(pi*t/Ts);
I = I0*sinus(t-(n-1)*Tc).*(t<=((n-1)*Tc+Ts));
dV = (I-V/R)/C;

end

