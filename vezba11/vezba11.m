r = xlsread('Podaci o rastu HCC.xlsx');
dani = r(:,1)';
velicina_HCC = r(:,2)';
plot(dani,velicina_HCC, 'o', 'linewidth', 1.5);
hold on;
ylim([0 25]);
p = polyfit(dani, log(velicina_HCC), 1);  %%17. MIN
lambda_exp = p(1); %brzina rasta za ekspon model
b = p(2);
V0_exp = exp(b);
V_exp = V0_exp*exp(lambda_exp*dani);
plot(dani,V_exp, 'linewidth', 1.5);
hold on;

V_log = @(x,dani) x(1)*x(2)./(x(2)+(x(1)-x(2))*exp(-x(3)*dani));  %ovo moramo da znamo 
x0 = [21.64,0.002,0.1237]; %pocetne vrednosti: K- najveca velicina HCC; V0-najmanja velicina HCC, lambda=bryina rasta iz eksponencijalnog modela
x = lsqcurvefit(V_log, x0, dani, velicina_HCC); %moramo da znamo poziv ove fje
plot(dani,V_log(x,dani), 'linewidth', 1.5);
hold on;
K_log = x(1);
V0_log = x(2);
lambda_log = x(3);

V_Gom = @(x,dani) x(1)*(x(2)/x(1)).^exp(-x(3)*dani); %ovo treba da znamo da napisemo 
x0 = [20, 0.002, 0.1237]; %pocetne vrednosti K=nivo tasicenosti iy log modela, V0 najmanja velicina HCC, lambda=brz rsta iz eks mod
x = lsqcurvefit(V_Gom, x0,dani, velicina_HCC);
plot(dani,V_Gom(x,dani),'linewidth',1.5);
hold on;
K_Gom = x(1);
V0_Gom = x(2);
lambda_Gom = x(3);
title('Fitovanje rasta hepatocelularnog karcinoma');
xlabel('Dani', 'FontSize', 12);
ylabel('podaci', 'eksponencijalni model', 'logisticki model', 'Gompertz model', 'FontSize', 12);
V_exp100 = V0_exp*exp(lambda_exp*100);
fprinff('Prema eks. modelu, velicina HCC karcinome u [mm^3] 100. dana je %5.3\n', V_exp100);
V_log100 = K_log*V0_log/(V0_log +(K_log-V0_log)*exp(-lambda_log*100));
fprinff('Prema elog. modelu, velicina HCC karcinome u [mm^3] 100. dana je %5.3\n', V_log100);
V_Gom100 = K_Gom*(V0_Gom/K_Gom)^exp(-lambda_Gom*100);
fprinff('Prema Gom. modelu, velicina HCC karcinome u [mm^3] 100. dana je %5.3\n', V_Gom100);


