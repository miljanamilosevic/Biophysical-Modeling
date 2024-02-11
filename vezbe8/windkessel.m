R = 0.95; %otpor glavne aorte protoka krvi
C = 0.7*1.06; %compliance glavne aorte
L = 0.1; %intertance glavne aorte
r = 0.05; %otpor zaliska aorte protoku krvi
I0 = 424; 
Tc = 60/72; %perioda srcanog ciklusa Tc=1/f/min/72=60s/72
Ts = (2/5)*Tc; %trajanje sistolne faze
cycle = 5; %broj ciklusa
V0 = 75; %pocetna vrednost pritiska
sinus = @(t)sin(pi*t/Ts);

for n=1:cycle
    param1=[Tc, Ts, n, I0, R, C];
    param2=[Tc, Ts, n, I0, R, C, r];
    param3=[Tc, Ts, n, I0, R, C, r, L];
    t=(n-1)*Tc:0.01:n*Tc; %75 otkucaja => perioda 0.08, moze 0.01, ne bi moglo 0.1
    %sa 0.01 imamo 80 tacaka, a sa 0.1 bismo imali 8 tacke sto je jako malo
    I = I0*sinus(t-(n-1)*Tc).*(t<=((n-1)*Tc+Ts));
    [t, V1] = ode45(@windkessel2, t, V0, [], param1);
    [t, V2] = ode45(@windkessel3, t, V0, [], param2);
    [t, V3] = ode45(@windkessel4, t, V0, [], param3);
    subplot(4,1,1);
    plot(t,I, 'linewidth', 1.5);
    xlim([0 n*Tc]);
    ylim([0 600]);
    title('Zapreminski protok krvi kroz aortu');
    xlabel('Vreme [s]');
    ylabel('Protok krvi [cm^3/s]');
    hold on;
    subplot(4,1,2);
    plot(t,V1, 'linewidth', 1.5);
    xlim([0 n*Tc]);
    ylim([50 200]);
    title('Promena pritiska u aorti prema modelu sa 2 elementa');
    xlabel('Vreme [s]');
    ylabel('Pritisak [mmHg]');
    hold on;
    subplot(4,1,3);
    plot(t,V2, 'linewidth', 1.5);
    xlim([0 n*Tc]);
    ylim([50 200]);
    title('Promena pritiska u aorti prema modelu sa 3 elementa');
    xlabel('Vreme [s]');
    ylabel('Pritisak [mmHg]');
    hold on;
    subplot(4,1,4);
    plot(t,V3, 'linewidth', 1.5);
    xlim([0 n*Tc]);
    ylim([50 200]);
    title('Promena pritiska u aorti prema modelu sa 4 elementa');
    xlabel('Vreme [s]');
    ylabel('Pritisak [mmHg]');
    hold on;
end
hold off;

cycle=1;
for n=1:cycle
param1=[Tc, Ts, n, I0, R, C];
param2=[Tc, Ts, n, I0, R, C, r];
param3=[Tc, Ts, n, I0, R, C, r, L];
t=(n-1)*Tc:0.01:n*Tc; %75 otkucaja => perioda 0.08, moze 0.01, ne bi moglo 0.1
    %sa 0.01 imamo 80 tacaka, a sa 0.1 bismo imali 8 tacke sto je jako malo
I = I0*sinus(t-(n-1)*Tc).*(t<=((n-1)*Tc+Ts));
[t, V1] = ode45(@windkessel2, t, V0, [], param1);
[t, V2] = ode45(@windkessel3, t, V0, [], param2);
[t, V3] = ode45(@windkessel4, t, V0, [], param3);
figure;
 plot(t,V1, 'linewidth', 1.5);
    xlim([0 Tc]);
    ylim([60 180]);
    title('Promena pritiska u aorti');
    xlabel('Vreme [s]');
    ylabel('Pritisak [mmHg]');
    hold on;
     plot(t,V2, 'linewidth', 1.5);
      plot(t,V3, 'linewidth', 1.5);
      legend('Model sa 2 elementa', 'Model sa 3 elementa', 'Model sa 4 elementa');
    hold on;
end