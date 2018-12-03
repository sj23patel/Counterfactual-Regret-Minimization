function [oppstrategy ,oppstrategy_sum, oppregret_sum, num_actions] = getstrategy(num_actions,oppregret_sum,oppstrategy_sum,oppstrategy) 
norm_sum=0;
for a=1:num_actions
    if(oppregret_sum(a)>0)
        oppstrategy(a)=oppregret_sum(a);
    else
        oppstrategy(a)=0;
    end
    norm_sum=norm_sum+oppstrategy(a);
end
for a=1:num_actions
    if(norm_sum>0)
        oppstrategy(a)=oppstrategy(a)/norm_sum;
    else
        oppstrategy(a)=1/num_actions;
    end
    oppstrategy_sum(a)=oppstrategy_sum(a)+oppstrategy(a);
end
end