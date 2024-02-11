function dV = windkessel4(t, V, param3)
Tc = param3(1);
Ts = param3(2);
n = param3(3);
I0= param3(4); %maksimum protoka
R = param3(5); 
C = param3(6);
r = param3(7);
L = param3(8); %efekat inercije krvi
sinus = @(t)sin(pi*t/Ts);
cosinus = @(t)cos(pi*t/Ts);
I = I0*sinus(t-(n-1)*Tc).*(t<=((n-1)*Tc+Ts));
I1 = I0*cosinus(t-(n-1)*Tc).*(t<=((n-1)*Tc+Ts)); %izvod protoka po vremenu
I2 = -I0*sinus(t-(n-1)*Tc).*(t<=((n-1)*Tc+Ts));
dV = ((1+r/R)*I + (r*C+L/R)*I1+L*C*I2-V/R)/C;
end

