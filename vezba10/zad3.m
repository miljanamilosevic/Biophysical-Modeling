days = [10, 11, 12, 13, 14, 15, 19, 22];
bacteria = [4, 7, 12, 12, 19, 25, 76, 125]*10^3;
plot(days, bacteria, 'o', 'linewidth', 1.5);
hold on;
%fitovanje eksponencijalnom funkcijom y=e^(a*x+b)
p = polyfit(days, log(bacteria), 1);
a = p(1)
b = p(2)
time = linspace(8,23,360);
%prikaz od osmog do 23. dana sa korakom 1h (23-8)*24
ymodel = exp(a*time+b);
plot(time, ymodel, 'linewidth', 1.5);
hold on;
fit_function = @(x)exp(a*x+b);
day_28 = fit_function(28);
fprintf('Prema fitovanju, broj bakterija 28. dana je %7.0f\n', day_28);
p = polyfit(days, bacteria, 3); %fitovanje polinomom treceg reda
ymodel_test = polyval(p, time);
%%% fali jedan red
plot(time, ymodel_test, 'linewidth', 1.5);
%%%fali title, label i legend

