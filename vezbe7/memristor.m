
mem = xlsread('Memristor'); 
V = mem(:,2);
I = mem(:,3)*10^6;
plot(V, I, 'linewidth', 2);
title('Strujno-naponska karakteristika memristora');
xlabel('Napon [V]');
ylabel('Struja [/muA]');


E = -65*10^(-3); %ravnotezni membranski potencijal
M = mem(:,1); %memristansa memristora
C = 1*10^(-9); %kapacitivnost membrane neurona
Vth = -55*10^(-3); %prag okidanja
Vspike = 30*10^(-3); %vrh tj. maksimum spike
Vreset = -80*10^(-3); %minimum ispod ravnoteznog potencijala
Iapp = 1.5*10^(-9); %struja stimulusa
tpulse = 0.05; %pocetak delovanja stimulusa
lengthpulse = 0.15; %duzina trajanja stimulusa
N = length(M); %broj tacaka u kojima se odredjuje V
tmin = 0; %vreme pocetka simulacija
tmax = 0.57*N*10^(-3) ; %vreme do kojeg se izvrsavaju simulacije (250/438 = 0.57)
T = linspace(tmin,tmax,N); %vremenski opseg sa diskretnim koracima
dt = T(2)-T(1); %vremenski korak odredjivanja resenja
I = zeros(size(T)); %inicijalizacija vektora za struju stimulusa
V = zeros(size(T)); %inicijalizacija vektora za membranski potencijal
tau = zeros(size(T)); %inicijalizacija vektora za vremensku konstantu
V(1) = E; %pocetni uslov, neuron je u stanju mirovanja

idx = T>=tpulse & T<=tpulse+lengthpulse;
I(idx) = Iapp; %generisanje strujnog impulsa

for i=1:N
    tau(i) = M(i)*C;
end

for t=1:N-1
    if (V(t)==Vspike) %proverava da li je spike dostigao maksimum
        V(t+1) = Vreset; %reset posle generisanja spike
    else
        V(t+1) = V(t) + (dt/tau(t))*(E-V(t)+M(t)*I(t)); %resavanje jednacine modela za V
    end
    if V(t+1)>Vth %proverava da li je potencijal dostigao prag okidanja
        V(t+1) = Vspike; %postavi vrednost na maksimalnu vrednost spike
    end
end

figure
subplot(2,1,1);
plot(T*10^3,I*10^9);
title('Struja stimulusa');
xlabel('Vreme [ms]');
ylabel('Struja I[nA]');
subplot(2,1,2);
plot(T*10^3,V*10^3);
title('Spikes');
xlabel('Vreme [ms]');
ylabel('Membranski potencijal V[mV]');


