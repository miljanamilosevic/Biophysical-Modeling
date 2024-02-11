Tc = 1; %perioda srcanog ciklusa 
Ts = Tc/3; %trajanje sistolne faze
Es = 2.5; %maks vrednost elastanse srcane komore-ovo se moze staviti da je 1.5 za proveru
Ed = 0.1; %min vrednost ...
Ca = 1.5; %copmliance arterija-ovo mozemo da smanjimo za proveru
Cv = 100; %compliance vena
R1 = 0.03; %vaskularni otpor pri izlasku krvi iz komore srca-mozes da stavis da je 0.1 za proveru
R2 = 0.01; %vask otpor pri ulasku krvi u komoru srca
R0 = 0.95; %ukupni periferni vaskularni otpor protoku krvi
tspan = 0:0.01:10;  %10*Tc umesto 10
Q0 = 140; %poc uslov za prptok krvi
Va0 = 80; %poc uslov za arterijski pritisak
Vv0 = 15; %poc uslov za venski pritisak
x0 = [Q0, Va0, Vv0];
param = [Tc,Ts,Es,Ed,Ca,Cv,R1,R2,R0];
[t,x] = ode45(@KVsistem, tspan, x0, [], param);

Q = x(:,1);
Va = x(:,2);
Vv = x(:,3);

%definisanje elastanse za vise perioda
for m = 1:length(t)
    ttemp = mod(t(m),Tc); %mod funkcija daje ostatak pri deljenju t sa Tc
if ttemp<=(Tc/3) %definisanje elastanse
    E(m) = (3*(Es-Ed)*ttemp)/Tc+Ed;
end
if (ttemp>(Tc/3))&&(ttemp<=(Tc/2))
    E(m) = (6*(Ed-Es)*ttemp)/Tc+3*Es-2*Ed;
end
if ttemp>(Tc/2)
    E(m) = Ed;
end
end

Vs = E.*Q'; %pritiska u levoj komori srca

%iscrtavanje rezultata
vreme = t(1:1001); %10 perioda
subplot(2,1,1);
plot(vreme, E(1:length(vreme)), 'linewidth', 1.5);
title('Elastansa leve komore srca');
xlabel('Vreme [s]', 'FontSize', 12);
ylabel('Elastansa [mmHg/cm^3]', 'FontSize', 12);
hold on;
subplot(2,1,2);
plot(vreme, Vs(1:length(vreme)), 'linewidth', 1.5);
hold on;
plot(vreme, Va(1:length(vreme)), 'linewidth', 1.5);
plot(vreme, Vv(1:length(vreme)), 'linewidth', 1.5);
ylim([0 180]);
title('Promena pritiska u levoj komori srca,arterijama i venama');
xlabel('Vreme [s]', 'FontSize', 12);
ylabel('Pritisak [mmHg]', 'FontSize', 12);
legend('Pritisak u levoj komori srca', 'Arterijski pritisak', 'Centralni venski pritisak');