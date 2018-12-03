clc;
clear all;
close all;
num_action=3;
random1 = rand(1, num_action); % Start with 3 random numbers that don't sum to 1.
random1 = random1 / sum(random1);  % Normalize so the sum is 1.
theSum = sum(random1);  % Check to make sure.  Should be 1
random2 = rand(1, num_action); % Start with 3 random numbers that don't sum to 1.
random2 = random2 / sum(random2);  % Normalize so the sum is 1.
theSum = sum(random2);  % Check to make sure.  Should be 1
regret_sum=[random1(1,1)*10 random1(1,2)*10 random1(1,3)*10];
oppstrategy=[0 0 0];
strategy=[0 0 0];   
oppregret_sum=[random2(1,1)*10 random2(1,2)*10 random2(1,3)*10];
oppstrategy_sum=[0 0 0];
[action_utility, oppaction_utility, strategy, oppstrategy, ~, oppstrategy_sum, regret_sum, oppregret_sum, num_action]=train(500,strategy, oppstrategy, oppstrategy_sum, oppstrategy_sum, regret_sum, oppregret_sum, num_action);
