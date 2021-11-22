function [c] = CountL(ls)
len = length(ls);
pre = ls(1);
c = zeros(1 , len);
for i= 2: len
    if ls(i) ~= pre
        c(i) = 1;
        pre = ls(i);
    end
end
