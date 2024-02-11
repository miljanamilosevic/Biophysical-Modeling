function dx = KVsistem(t,x,param)
Tc = param(1);
Ts = param(2);
Es = param(3);
Ed = param(4);
Ca = param(5);
Cv = param(6);
R1 = param(7);
R2 = param(8);
R0 = param(9);
ttemp = mod(t,Tc); %mod funkcija daje ostatak pri deljenju t sa Tc
if ttemp<=(Tc/3) %definisanje elastanse
    E = (3*(Es-Ed)*ttemp)/Tc+Ed;
end
if (ttemp>(Tc/3))&&(ttemp<=(Tc/2))
    E = (6*(Ed-Es)*ttemp)/Tc+3*Es-2*Ed;
end
if ttemp>(Tc/2)
    E = Ed;
end
if ttemp<Ts %ispumpavanje krvi iz leve komore srca tokom sistole
    qp = 1;
else
    qp = 0;
end
if ((E*x(1))>=x(2))&&(qp==1) %ako je Vs<=Va tokom sistole
    q1 = 1;
else
    q1 = 0;
end
if ttemp<(Tc/2) %ulivanje krvi u komoru srca tokom dijastole
    q2 = 0;
else
    q2 = 1;
end

%jednacine modela
dx1 = (-(q1/R1 + q2/R2))*E*x(1)+(q1/R1)*x(2)+(q2/R2)*x(3);
dx2 = (q1/(R1*Ca))*E*x(1)-(q1/(R1*Ca)+1/(R0*Ca))*x(2)+(1/(R0*Ca))*x(3);
dx3 = (q2/(R2*Cv))*E*x(1)+(1/(R0*Cv))*x(2)-(1/(R0*Cv)+q2/(R2*Cv))*x(3);
dx = [dx1; dx2; dx3];


end

