function dh = promenljiva_h(t, h, V)
alfa_h = 0.07*exp(-V/20);
beta_h = 1/(exp((30-V)/10)+1);
dh = alfa_h*(1-h)-beta_h*h;
end


