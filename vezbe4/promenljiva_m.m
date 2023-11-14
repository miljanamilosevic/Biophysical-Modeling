function dm = promenljiva_m(t, m, V)
alfa_m = (25-V)/(10*(exp((25-V)/10)-1));
beta_m = 4*exp(-V/18);
dm = alfa_m*(1-m)-beta_m*m;
end

