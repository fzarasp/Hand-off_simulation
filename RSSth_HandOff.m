function [Bs] = RSSth_HandOff(RSS1 , RSS2 , RSS3 , RSS4,th, first)
Ns = length(RSS1);
Bs = zeros(1,Ns);
Bs(1) = first;
base = RSS1;
for k = 2:Ns
    if base(k) < th
        m = max([RSS1(k) , RSS2(k) , RSS3(k) , RSS4(k)]);
        if m == RSS1(k)
            Bs(k) = 1;
            base = RSS1;
        end
        if m == RSS2(k)
            Bs(k) = 2;
            base = RSS2;
        end
        if m == RSS3(k)
            Bs(k) = 3;
            base = RSS3;
        end
        if m == RSS4(k)
            Bs(k) = 4;
            base =RSS4;
        end
    else
        Bs(k) =Bs(k - 1);
    end
    
end
end
