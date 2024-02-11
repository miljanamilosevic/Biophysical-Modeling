a = 0.02;
b = 0.2;
c = -65;
d = 2;
Vspike = 30; %vrh tj. maksimalan spike
Iapp = 10; %struja stimulusa
tpulse = 10; %pocetak delovanja stimulusa
lengthpulse = 50; %duzina trajanja stimulusa
tmax = 70; %vreme do kojeg se izvrsavaju simulacije
dt = 0.001; %vremenski korak odredjivanja resenja
Nt = tmax/dt; %broj tacaka u kojima se odredjuje resenje
T = 0:dt:tmax; %vremenski opseg sa diskretnim koracima
I = zeros(size(T)); %inicijalizacija vektora za struju stimulusa
V = zeros(size(T)); %inicijalizacija vektora za promenljvu V
u = zeros(size(T)); %inicijalizacija vektora za promenljivu oporavka
V(1) = -70; %pocetni uslov, membrana neurona je u stanju mirovanja
u(1) = b*V(1); %pocetni uslov za promenljivu oporavka

for t = tpulse/dt:(tpulse+lengthpulse)/dt
I(t) = Iapp; %generisanje strujnog impulsa
end

for t=1:Nt
    V(t+1) = V(t) + dt*(0.04*V(t)^2+5*V(t)+140-u(t)+I(t)); %resavanje jednacine modela za V
    u(t+1) = u(t) + dt*a*(b*V(t)-u(t)); %resavanje jednacine modela za u
    if (V(t+1)>=Vspike) %proverava da li je spike dostigao maksimum
        V(t+1) = c; %reset posle generisanja spike
        u(t+1) = u(t+1) + d;
    end
end

%iscrtavanje rezultata simulacija
subplot(3,1,1);
plot(T,I);
title('Struja stimulusa');
xlabel('Vreme [ms]');
ylabel('Parametar I');
subplot(3,1,2);
plot(T,V);
title('Spikes');
xlabel('Vreme [ms]');
ylabel('Promenljiva V');
subplot(3,1,3);
plot(T,u);
title('Promenljiva oporavka');
xlabel('Vreme [ms]');
ylabel('Promenljiva u');