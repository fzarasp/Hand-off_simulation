function [c , numbers] = Count(ls)
ls2 = sort(ls);
len = length(ls2);
numbers = 0;
c = 0;
numbers(1) = ls2(1);
item = numbers(1);
lst = find(ls2 == ls2(1));
c(1) = length(lst);
ind = 1;
for i= 2: len
    if ls2(i) ~= item
        item = ls2(i);
        ind = ind + 1;
        numbers(ind) = item;
        lst = find(ls2 == ls2(i));
        c(ind) = length(lst);
    end
end

       
       
