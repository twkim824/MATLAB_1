% Homework Program 1
%
% Name: Kim, TaeWon
% Section: 30
% Date 9/23/2016

% Data

function [x,top_page] = pagerank(H,d)

H = [0 0 1/2 0 1/3 0;0 0 0 0 1/3 0;
    0 1/2 0 1/2 0 1/3;0 0 0 0 1/3 1/3;
    0 1/2 0 0 0 1/3;1 0 1/2 1/2 0 0];

d = 0.5:0.1:0.9;

N = size(H,1);

[M,N] = size(H);
if M ~= N
    error('Hyperlink matrix must be square');
elseif N < 1
    error ('Must have at least 1 page');
elseif N == 1
    x = 1
elseif N <= 10000


% Create a 6-by-5 matrix called "PageRank" of zeros
%
PageRank = zeros(6,5);

% Replace each column of PageRank with result of the PageRank
% calculation for the corresponding entry in the row vector d
%
PageRank(:,1) = (eye(6) - d(1)*H)\((1-d(1))*ones(6,1));
PageRank(:,2) = (eye(6) - d(2)*H)\((1-d(2))*ones(6,1));
PageRank(:,3) = (eye(6) - d(3)*H)\((1-d(3))*ones(6,1));
PageRank(:,4) = (eye(6) - d(4)*H)\((1-d(4))*ones(6,1));
PageRank(:,5) = (eye(6) - d(5)*H)\((1-d(5))*ones(6,1));

%Plot and label the graph
plot(d,PageRank,'o-')
xlabel('Damping Factor')
ylabel('Page Rank')
legend('Page 1','Page 2','Page 3','Page 4','Page 5','Page 6')
title('Changing d sometimes changes the rank order')
end