x = [0, 1.7, 1.95, 2.6, 2.92, 4.04, 5.24];
y = [0, 2.6, 3.6, 4.03, 6.45, 11.22, 30.61];
plot(x,y, 'o', 'linewidth', 1.5);
hold on;
new_x = 0:0.1:6; %generisanja tacaka za testiranje modela
for n = 1:3    %2 ako je kvadratni, 1 ako je linearni, u p se citaju vrednosti 
    p = polyfit(x,y,n);
    ymodel = polyval(p, new_x); 
    plot(new_x, ymodel, 'linewidth', 1.5);
    hold on;
end
title('Fitovanje eksp. podataka');
xlabel('x', 'FontSize', 14);
ylabel('y', 'FontSize', 14);
%legend('podaci’, 'linearni model', 'kvadratni model’, 'kubni model','FontSize',12);

