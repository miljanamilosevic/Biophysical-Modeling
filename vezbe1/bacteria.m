% Za ispitivanje antibiotika na Staphylococcus aureus u eksperimentalnim
% uslovima razvijen je jednostavan empirijski model promene bakterijske
% populacije: dn/dt=bn-pn^2. 
%Prvi clan bn predstavlja brzinu rasta bakterijske populacije na
%polucvrstoj podlozi koja sadrži 0.5% agara. Drugi clan pn^2 predstavlja
%brzinu uništenja bakterijske populacije pod dejstvom ispitivanog
%antibiotika.
%Ako je b=jedna bakterija/30minuta i p=0.5bakterija*h, odrediti broj
%bakterija posle 1h dejstva antibiotika pretpostavljajuci da je inicijalno
%bilo 100 bakterija na podlozi. 

function dn = bacteria(t,n,param)
b = param(1);
p = param(2);
dn = b*n-p*n^2;
end

