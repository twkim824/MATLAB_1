function check_dep(A,B)

% CHECK_DEP checks for linear dependence relations.
%
% Function CHECK_DEP shows the linear combination of the columns of A
% to get each column of B.
%
% Define variables:
%
% A: a mxn matrix
% B: a mxk matrix

% Homework Program 6

% Name: Kim, TaeWon
% Section: 30
% Date: 31/10/16

if isempty(A)
    error ('Matrix A should not be empty');
end

if isempty(B)
    error ('Matrix B should not be empty');
end

if size(A,1) ~= size(B,1)
    error ('Matrix A and Matrix B should have the same number of rows.');
end

if rank(A) >= size(A,1)
    fprintf('The span of the columns of A includes all vectors in R%.0f \n',...
        size(A,2));
end




for ii = 1:size(B,2) % for 1 : number of columns in B
    
    augmented = [A B(:,ii)];
    
    reduced = rref(augmented);
    
    [~,piv] = rref(augmented); % this returns a vector showing the positions
                               % of the pivots
                               
    if piv(end) == size(reduced,2); % if there is a pivot in the last column,
                                    % there is no solution.
                                    
        fprintf('b%.0f is not a linear combination of the columns of A. \n',ii);
        
    else 
       
        fprintf('b%.0f = ',piv(ii)); % e.g. b1 = ...
         
            for jj = 1:size(reduced,1)
        
                if reduced(jj,end) == 0 % Set free variable to zero.
                    
                fprintf(''); % Print nothing.
                
                else
                    
                    fprintf('+ %0.2f a%.0f ',reduced(jj,end),jj)
                    
                end
                
            end
            
        fprintf('\n');
        
    end
    
end

            
            
            
% Test case 1                
% A = [1 0 0;0 1 0;0 0 1];
% B = [2;3;4];
% check_dep(A,B)
% The span of the columns of A includes all vectors in R3 
% b1 = + 2.00 a1 + 3.00 a2 + 4.00 a3             

% Test case 2
% A = [1 0; 0 1; 0 0];, B = [1 1; 2 2; 3 0];
% check_dep(A,B)
% b1 is not a linear combination of the columns of A. 
% b2 = + 1.00 a1 + 2.00 a2 

% Test case 3
% A= [1 1 2 4 1; -2 -7 1 2 -2; 3 8 -4 -3 -2];, B= A*ones(5,1);
% check_dep(A,B)
% The span of the columns of A includes all vectors in R5 
% b1 = + 2.00 a1 + 1.00 a2 + 3.00 a3 
    
% Test case 4
% A= rand(3,2);, B= ones(3,1);
% check_dep(A,B)
% b1 is not a linear combination of the columns of A. 


% Test case 3: Swapping 1st and second columns    
% A = [1 1 2 4 1;-7 -2 1 2 -2;8 3 -4 -3 -2]    
% B = A*ones(5,1)    
% check_dep(A,B)
% The span of the columns of A includes all vectors in R5 
% b1 = + 1.00 a1 + 2.00 a2 + 3.00 a3     

% % Test case 3: Swapping 4th and 5th columns
% A = [1 1 2 1 4;-2 -7 1 -2 2;3 8 -4 -2 -3]
% B = A*ones(5,1);
% check_dep(A,B)
% The span of the columns of A includes all vectors in R5 
% b1 = + 2.00 a1 + 1.00 a2 + 3.00 a3 

% Test case 5

% Last column of A = B
% A = [1 1 -3;2 5 -2;-2 5 0];
% B = [-2.5; -1; -1];
% check_dep(A,B)
% The span of the columns of A includes all vectors in R3 
% b1 = + 0.50 a1 + 1.00 a3 

% Second last column of A = B
% A = [1 1 -2.5;2 5 -1;-2 5 -1];
% B = [-3; -2; 0];
% check_dep(A,B)
% The span of the columns of A includes all vectors in R3 
% b1 = + -0.50 a1 + 1.00 a3 

% Second column of A = B
% A = [1 -3 -2.5;2 -2 -1;-2 0 -1];
% B = [1;5;5];
% check_dep(A,B)
% b1 is not a linear combination of the columns of A.

% First column of A = B
% A = [1 -3 -2.5;5 -2 -1;5 0 -1];
% B = [1;2;-2];
% check_dep(A,B)
% The span of the columns of A includes all vectors in R3 
% b1 = + -2.00 a2 + 2.00 a3 

% Test case 5: The columns of A are linearly independent

% Test case 6

% A = randi([0 5],5,3)
% 
% A =
% 
%      4     0     0
%      5     1     5
%      0     3     5
%      5     5     2
%      3     5     4

% First column of A = B
% A = [0 0;1 5;3 5;5 2;5 4];
% B = [4;5;0;5;3];
% check_dep(A,B)
% b1 is not a linear combination of the columns of A. 

% Second column of A = B
% A = [4 0;5 5;0 5;5 2;3 4];
% B = [0;1;3;5;5];
% check_dep(A,B)
% b1 is not a linear combination of the columns of A.

% Third column of A = B
% A = [4 0;5 1;0 3;5 5;3 5];
% B = [0;5;5;2;4];
% check_dep(A,B)
% b1 is not a linear combination of the columns of A.

% Test case 6: The columns in A are linearly independent
