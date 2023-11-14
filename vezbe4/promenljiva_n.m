function dn = promenljiva_n(t, n, V)
alfa_n = (10-V)/(100*(exp((10-V)/10)-1));
beta_n = 0.125*exp(-V/80);
dn = alfa_n*(1-n)-beta_n*n;
end

