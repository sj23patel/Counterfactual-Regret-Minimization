function avgstrategy = getavgstrategy(num_action,strategysum)
avgstrategy=[0 0 0];
norm_sum=0;
for a=1:num_action
    norm_sum = norm_sum+strategysum(a);
end
for a=1:num_action
    if(norm_sum>0)
        avgstrategy(a)=strategysum(a)/norm_sum;
    else
        avgstrategy(a)=1/num_action;
    end

end
end