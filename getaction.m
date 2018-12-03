function a = getaction(num_action,strategy)
a=1;
cum_prob=0;
r=rand;
while(1)
    if(a>num_action-1)
        break;
    end
    cum_prob=cum_prob+strategy(a);
    if(r<cum_prob)
        break;
    end
    a=a+1;
end

end