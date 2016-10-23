% EA 1, Homework program assignment 3

% Name: Kim, TaeWon
% Section: 30
% Date: 10/13/2016

% Inputting the budget

budget = input('Enter your initial budget in dollars: ');

while budget < 1
    disp('Your budget needs to be equal to or greater than 1.');
    budget = input('Input your initial budget in dollars: ');
end

fprintf('Your cap on total winnings is $%.2f. \n',2*budget)
cap = 2*budget;

cont = 1;

% Number of contestants
n = input('Input the number of contestants: ');

x = (n > 1);
while x == 0
    display('There must be at least two contestants')
    n = input('Input the number of contestants: ');
    x = (n > 1);
end

y = 1;
k = 0;
m = 0;
sum_bets_array = [];
budget_array = [];
empty_matrix_2 = [];
race_num = 0;

while cont == 1   % This while loop determines whether or not
                  % the player wants to start a new game
    
    race_num = race_num + 1;

    % Contestants' odds
   
    avg_time = 2 * rand(1,n) + 1;
    
    prob_win = (1./(avg_time)) / sum(1 ./ avg_time);

    disp('The contestants'' odds:')
    payout = 1 ./ prob_win
    
    
    % Inputting bets
    bets = input('Input your bets in the form [x y z etc.] with n elements: ');

    % Ensuring there are n elements, the total bets are less than the
    % budget, and that the total bets are at least 0.
    x = (size(bets,2) == n) && (sum(bets) <= budget) && (sum(bets) >= 0 && ~(any(bets <= 0)));
    
    while x == 0
    disp('Make sure that your bets do not exceed your budget and that your array has n elements.')
    bets = input('Reinput your bets in the form [x y z ...] with n elements: ');
    x = (size(bets,2) == n) && (sum(bets) <= budget) && (sum(bets) >= 0);
    end

    % Calculating used budgets
    used_budget = sum(bets);

    fprintf('You spent a total of $%.2f on your bets. \n',sum(bets))

    % Contestants' results
    disp('The average time of each contestant is:')
    avg_time = random('exp',avg_time)

    % Determining which contestant had the fastest time
    x = find(avg_time == min(avg_time));
    fprintf('The winner is contestant no. %d \n',x)

    % Calculating new budget
    new_budget = budget - sum(bets) + sum(bets(1,x) .* payout(1,x));

    fprintf('Your new budget is $%.2f .\n',new_budget)

    budget = new_budget;
   
    % Filling in the empty array showing sum of bets
    
    k = k + 1;
    sum_bets_array (1,k) = sum(bets);
    
    m = m + 1;
    budget_array (1,m) = budget;
    
    if budget > cap
        disp('Congratulations! You exceeded your cap!')
        cont = 0;

        elseif budget < 1
        disp('Your budget is now below the minimum bet.')
        cont = 0;

        else  % Ask player if they want to continue or not
        cont = input('Continue to new race? (1 = Yes, 0 = No)  ');
        x = (cont == 1 || cont == 0);

        % Ensuring player enters 0 or 1
        if cont ~= (1 || 0)
            while x == 0
            disp('Please enter 1 (yes) or 0 (no).')
            cont = input('Continue to new race? (1 = Yes, 0 = No)   ');
            x = (cont == 1 | cont == 0);
            end
        else
    end

    end
    
        if cont == 0  % End the game
        disp('The game is over.')
        
        disp('Summary of all your games:')
        
        for ii = 1:race_num;
        
            fprintf('Race number %d: bet $%.2f, budget $%.2f. \n', ii,sum_bets_array(1,ii),budget_array(1,ii))
        
        end
     
        elseif cont == 1
        % Restart the game
    else
        end
end

   


% Scenario 1: Budget drops below one

% Enter your initial budget in dollars: 10
% Your cap on total winnings is $20.00. 
% Input the number of contestants: 4
% The contestants' odds:
% 
% payout =
% 
%     4.3368    3.1071    4.1999    4.7739
% 
% Input your bets in the form [x y z etc.] with n elements: [10 0 0 0]
% You spent a total of $10.00 on your bets. 
% The average time of each contestant is:
% 
% avg_time =
% 
%     2.3583    1.7910    1.7349    2.9760
% 
% The winner is contestant no. 3 
% Your new budget is $0.00 .
% Your budget is now below the minimum bet.
% The game is over.
% Summary of all your games:
% Race number 1: bet $10.00, budget $0.00. 


% Scenario 2: Budget exceeds the budget cap

% Enter your initial budget in dollars: 10
% Your cap on total winnings is $20.00. 
% Input the number of contestants: 4
% The contestants' odds:
% 
% payout =
% 
%     4.9315    4.2463    3.4121    3.7224
% 
% Input your bets in the form [x y z etc.] with n elements: [10 0 0 0]
% You spent a total of $10.00 on your bets. 
% The average time of each contestant is:
% 
% avg_time =
% 
%     1.4746    1.9177    2.9262    2.0936
% 
% The winner is contestant no. 1 
% Your new budget is $49.31 .
% Congratulations! You exceeded your cap!
% The game is over.
% Summary of all your games:
% Race number 1: bet $10.00, budget $49.31. 



% Scenario 3: Terminate the program by choosing not to when
% prompted. Enter the first vector of bets incorrectly.

% Enter your initial budget in dollars: 10
% Your cap on total winnings is $20.00. 
% Input the number of contestants: 4
% The contestants' odds:
% 
% payout =
% 
%     3.1221    5.9897    2.9759    5.6588
% 
% Input your bets in the form [x y z etc.] with n elements: [9 1]
% Make sure that your bets do not exceed your budget and that your array has n elements.
% Reinput your bets in the form [x y z ...] with n elements: [1 1 1 1]
% You spent a total of $4.00 on your bets. 
% The average time of each contestant is:
% 
% avg_time =
% 
%     1.9883    2.5581    2.4301    2.8074
% 
% The winner is contestant no. 1 
% Your new budget is $9.12.
% Continue to new race? (1 = Yes, 0 = No)  1
% The contestants' odds:
% 
% payout =
% 
%     5.8210    3.4910    5.0168    2.9203
% 
% Input your bets in the form [x y z etc.] with n elements: [1 1 1 1]
% You spent a total of $4.00 on your bets. 
% The average time of each contestant is:
% 
% avg_time =
% 
%     1.0611    2.4881    2.0000    1.9598
% 
% The winner is contestant no. 1 
% Your new budget is $10.94 .
% Continue to new race? (1 = Yes, 0 = No)  0
% The game is over.
% Summary of all your games:
% Race number 1: bet $4.00, budget $9.12. 
% Race number 2: bet $4.00, budget $10.94. 