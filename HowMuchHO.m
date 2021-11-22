function [num] = HowMuchHO(ho)

num = 0;
for k = 2:length(ho)
    if ho(k - 1)~= ho(k)
       num = num + 1;
    end
end
end
