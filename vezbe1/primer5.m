function dy = primer5(t,y)
dy(1) = y(2);
dy(2) = -y(1);
dy = [dy(1); dy(2)];
end

