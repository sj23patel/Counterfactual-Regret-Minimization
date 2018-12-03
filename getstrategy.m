function [strategy ,strategy_sum, regret_sum, num_actions] = getstrategy(num_actions,regret_sum,strategy_sum,strategy) 
norm_sum=0;
for a=1:num_actions
    if(regret_sum(a)>0)
        strategy(a)=regret_sum(a);
    else
        strategy(a)=0;
    end
    norm_sum=norm_sum+strategy(a);
end
for a=1:num_actions
    if(norm_sum>0)
        strategy(a)=strategy(a)/norm_sum;
    else
        strategy(a)=1/num_actions;
    end
    strategy_sum(a)=strategy_sum(a)+strategy(a);
end
end