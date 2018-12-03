function [action_utility, oppaction_utility, strategy, oppstrategy, strategy_sum, oppstrategy_sum, regret_sum, oppregret_sum, num_action] = train(iterations,strategy, oppstrategy, strategy_sum, oppstrategy_sum, regret_sum, oppregret_sum, num_action)
%rock=1;paper=2;scissors=3;
% num_action=3;
% action_utility=[0 0 0];
% regret_sum=[0 0 0];strategy_sum=[0 0 0];oppstrategy=[0.4 0.3 0.3];
% strategy=getstrategy(num_action,regret_sum,strategy_sum);
my1=[];
my2=[];
my3=[];
ot1=[];
ot2=[];
ot3=[];
r1=[];
r2=[];
r3=[];
action_utility=[0 0 0];
oppaction_utility=[0 0 0];
for a=1:iterations
    [strategy ,strategy_sum, regret_sum, ~]=getstrategy(num_action,regret_sum,strategy_sum,strategy);
    [oppstrategy ,oppstrategy_sum, oppregret_sum, num_actions]=getoppstrategy(num_action,oppregret_sum,oppstrategy_sum,oppstrategy);
    if(a==1)
        strategy
        oppstrategy
    end
    myaction=getaction(num_action,strategy);
    otheraction=getaction(num_action,oppstrategy);
%     my=[my myaction];
%     ot=[ ot otheraction];
    action_utility(otheraction)=0;
    if(otheraction==num_action)
        action_utility(1)=1;
    else 
        action_utility(otheraction+1)=1;
    end
    if(otheraction==1)
        action_utility(num_action)=-1;
    else
        action_utility(otheraction-1)=-1;
    end
    oppaction_utility(myaction)=0;
    if(myaction==num_action)
        oppaction_utility(1)=1;
    else 
        oppaction_utility(myaction+1)=1;
    end
    if(myaction==1)
        oppaction_utility(num_action)=-1;
    else
        oppaction_utility(myaction-1)=-1;
    end
    action_utility;
    oppaction_utility;
    for a=1:num_action
    regret_sum(a)=regret_sum(a)+action_utility(a)-action_utility(myaction);
     oppregret_sum(a)=oppregret_sum(a)+oppaction_utility(a)-oppaction_utility(otheraction);
    end
    r1=[r1 regret_sum(1)];r2=[r2 regret_sum(2)];r3=[r3 regret_sum(3)];
    regret_sum;
    oppregret_sum;
    myavg=getavgstrategy(num_action,strategy_sum);
    otheravg=getavgstrategy(num_action,oppstrategy_sum);
    my1=[my1 myavg(1,1)];my2=[my2 myavg(1,2)];my3=[my3 myavg(1,3)];
    ot1=[ot1 otheravg(1,1)];ot2=[ot2 otheravg(1,2)];ot3=[ot3 otheravg(1,3)];    
%     err=sum(regret_sum);
%     err1=[err1 err];
    
%     strategy
%     oppstrategy

end

regret_sum;
% myavg=getavgstrategy(num_action,strategy_sum)
% otheravg=getavgstrategy(num_action,oppstrategy_sum)
myavg
otheravg
plot(1:iterations, r1,'color', 'r');
title('My regret');
hold on;plot(1:iterations, r2,'color','g');
hold on;plot(1:iterations, r3,'color','b');
xlabel('No of iterations'); ylabel('Regret sum');
legend('Rock','Paper', 'Sccisors');

figure;
plot(1:iterations, my1,'color', 'r');
title('My moves');
hold on;plot(1:iterations, my2,'color','g');
hold on;plot(1:iterations, my3,'color','b');
xlabel('No of iterations'); ylabel('Avg. Strategy');
legend('Rock','Paper', 'Sccisors');
ylim([0 1])
figure;
hold on;plot(1:iterations, ot1,'color', 'r');
title('Others moves');
hold on;plot(1:iterations, ot2,'color', 'g');
hold on;plot(1:iterations, ot3,'color', 'b');
xlabel('No of iterations'); ylabel('Avg. Strategy');
legend('Rock','Paper', 'Sccisors');
ylim([0 1])
%plot(my, ot);

end

