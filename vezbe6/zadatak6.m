a = 0.7;
b = 0.8;
epsilon = 0.08;
flag = 1; %izbor tipa struje stimulusa
tpulse = 100; %pocetak delovanja stimulusa
lengthpulse = 800; %duzina trajanja impulsa
tmax = 1000; %vreme do kojeg se izvrsavanju simulacije
dt = 0.01; %vremenski korak odredjivanja resenja - delta t iz sveske!!
Nt = tmax/dt; %broj tacaka u kojima se odredjuje resenje
T = 0:dt:tmax; %vremenski opseg sa diskretnim koracima
I = zeros(size(T)); %inicijalizacija vektora za struju stimulusa I
V = zeros(size(T)); %inicijalizacija vektora za promenljvu V
W = zeros(size(T)); %inicijalizacija vektora za promenljivu oporavka W
V(1) = 0; %pocetni uslov, membrana neurona je u stanju mirovanja
W(1) = 0; %pocetni uslov za promenljivu oporavka W
switch flag
    case 1
for t = tpulse/dt:(tpulse+lengthpulse)/dt
    I(t) = 1; %generisanje strujnog impulsa
end
    case 2
for t = tpulse/dt:(tpulse+lengthpulse)/dt
    I(t) = sin((t-tpulse/dt)/5000); %generisanje pobude tipa sinus
end 
 case 3
for t = tpulse/dt:(tpulse+lengthpulse)/dt
    I(t) = t/100000; %
end 
end
for t=1:Nt
    V(t+1) = V(t) + dt*(V(t)-V(t)^3/3-W(t)+I(t));
    W(t+1) = W(t) + dt*epsilon*(V(t)+a-b*W(t));
end
subplot(3,1,1);
plot(T,I);
title('Struja stimulusa');
xlabel('Vreme [ms]');
ylabel('Parametar I');
subplot(3,1,2);
plot(T,V);
title('Akcioni potencijal - spike');
xlabel('Vreme [ms]');
ylabel('Promenljiva V');
subplot(3,1,3);
plot(T,W);
title('Promenljiva oporavka');
xlabel('Vreme [ms]');
ylabel('Promenljiva W');