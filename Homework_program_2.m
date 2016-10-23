% Homework Program 2

% Name: Kim, TaeWon
% Section: 30
% Date: 10/05/2016

% Get inputs
r = input('Enter the value for r: ')
u = input('Enter the value for u: ')
n = input('Enter the value for n: ')

% Create Matrix A

A = randi(u,n,r);

% Create Matrix B

B = A(:,2:end);

% Create Matrix C

C = repmat(A(:,1),1,size(B,2));

% Calculate Matrix D

D = B == C;

% Calculate Matrix E

E = sum(D,2);

% Calculate tally and reps

[tally,reps] = hist(E,0:r-1);

% Find desired probabilities

probs = tally / n;

% Plot bar graph of results

bar(probs)
xlabel('Number of times the number is repeated')
ylabel('Probability')
title(sprintf('%u People, Numbers between 1 and %u, %u Trials',r,u,n))

% Create  a results matrix

Results = [[reps];[probs]]'

% Results of r=20, u=10, n=10^4:


%         0    0.1366
%    1.0000    0.2856
%    2.0000    0.2898
%    3.0000    0.1776
%    4.0000    0.0768
%    5.0000    0.0263
%    6.0000    0.0061
%    7.0000    0.0011
%    8.0000    0.0001
%    9.0000         0
%   10.0000         0
%   11.0000         0
%   12.0000         0
%   13.0000         0
%   14.0000         0
%   15.0000         0
%   16.0000         0
%   17.0000         0
%   18.0000         0
%   19.0000         0

% Results of r=10, u=6, n=10^6:

%         0    0.1937
%    1.0000    0.3488
%    2.0000    0.2789
%    3.0000    0.1308
%    4.0000    0.0389
%    5.0000    0.0077
%    6.0000    0.0011
%    7.0000    0.0001
%    8.0000    0.0000
%    9.0000    0.0000

