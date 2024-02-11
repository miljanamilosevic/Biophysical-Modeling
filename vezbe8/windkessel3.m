function dV = windkessel3(t, V, param2)
Tc = param2(1);
Ts = param2(2);
n = param2(3);
I0= param2(4);
R = param2(5);
C = param2(6);
r = param2(7);
sinus = @(t)sin(pi*t/Ts);
cosinus = @(t)cos(pi*t/Ts);
I = I0*sinus(t-(n-1)*Tc).*(t<=((n-1)*Tc+Ts));
I1 = I0*cosinus(t-(n-1)*Tc).*(t<=((n-1)*Tc+Ts)); %izvod protoka po vremenu
dV = ((1+r/R)*I + r*C*I1 - V/R)/C;
end

