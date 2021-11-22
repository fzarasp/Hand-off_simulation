function [probab ,loc]= ProbabilityRSSth(Ns , prob_num , th)

Rt1= zeros(1 , Ns);
Rt2= zeros(1 , Ns);
Rt3= zeros(1 , Ns);
Rt4= zeros(1 , Ns);
%prob_num = 1000;
loc = zeros(1 , Ns);
probab = zeros(1 , prob_num);
for k = 1 : prob_num
    [Rt1 , Rt2 , Rt3 , Rt4] = RSS();
    Bst = RSSth_HandOff(Rt1 , Rt2 , Rt3 , Rt4 , th , 1);
    probab(k) = HowMuchHO(Bst);
    loc = loc + CountL(Bst);
end
end


