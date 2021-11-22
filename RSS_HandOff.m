function [Bs] = RSS_HandOff(RSS1 , RSS2 , RSS3 , RSS4)
Ns = length(RSS1);
Bs = zeros(1,Ns);
for k = 1:Ns
    m = max([RSS1(k) , RSS2(k) , RSS3(k) , RSS4(k)]);
    if m == RSS1(k)
        Bs(k) = 1;
    end
    if m == RSS2(k)
        Bs(k) = 2;
    end
    if m == RSS3(k)
        Bs(k) = 3;
    end
    if m == RSS4(k)
        Bs(k) = 4;
    end
    
end
end
