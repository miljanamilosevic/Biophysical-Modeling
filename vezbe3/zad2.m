function dV = zad2(x,V,param)
ra = param(1);
rm = param(2);
[m,n] = size(V);
dV = zeros(m,n);
dV(1) = V(2);
dV(2) = (ra./rm).*V(1);
end

