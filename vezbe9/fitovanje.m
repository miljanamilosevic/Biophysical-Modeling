x = [0,1,2,3,4,5];
y = [15,10,9,6,2,0];
n = 1; %polinom prvog reda
p = polyfit(x,y,n);
a = p(1)
b = p(2)
ymodel = a*x + b;
plot(x,y, 'o', x, ymodel, 'linewidth', 1.5);
xlabel('x', 'FontSize', 14);
ylabel('y', 'FontSize', 14);
legend('podaci','linearni fit','FontSize',12);
