function [basis,coords] = find_coords(A)
% Given a matrix A, find a basis for the column space and write the
% coordinates of all the columns in terms of these basis vectors.

% Find sizes and pivots.
[m,n] = size(A);
[R,pivots] = rref(A);
p = length(pivots);

% *Preallocate a vector of zeros to contain the basis vectors for Col(A).*

basis = zeros(m,p);

for ii = 1:p
    % *Create a random vector of weights to make a linear combination of
    % the pivot columns of A.  Store this linear combination in the current
    % column of the basis matrix.*
    
    weights = rand(1,p);
    
    matrix = [];
    
    for jj = 1:p
        
        matrix(:,jj) = A(:,pivots(jj)) * weights(jj);
        
    end
    
    basis(:,ii) = sum(matrix, 2);
    
end


% *Preallocate a vector of zeros to contain the coordinates of the columns
% of A in terms of the new basis.*

coords = zeros(m,n);

for ii = 1:n
    
    % *Fill in the coords matrix with the coordinates for the columns of
    % A.*
    
    x = rref([basis A(:,ii)]);
    coords(:,ii) = x(:,end);
    
end

% Getting rid of rows of all zeros from the coords matrix.

S = all(coords');
T = find(~S);
coords(T,:) = [];


%%% PLOTTING COMMANDS (DO NOT CHANGE).
if m == 2
    figure;
    plot(0,0,'b*','LineWidth',4,'MarkerSize',12)
    hold on;
    axis equal
    all_vecs = [A basis];
    max_dim = max(max(abs(all_vecs)));
    xlim([-max_dim max_dim])
    ylim([-max_dim max_dim])
    xlabel('x1','FontSize',14)
    ylabel('x2','FontSize',14)
    title('Coordinates','FontSize',16)

    for ii = 1:p
        quiver(0,0,basis(1,ii),basis(2,ii),1.0,'LineWidth',5,'MaxHeadSize',.5,'Color',[1 0 0]);
        text(basis(1,ii),basis(2,ii),sprintf('b%d',ii),'FontSize',20);
    end
    
    for ii = 1:n
        quiver(0,0,A(1,ii),A(2,ii),1.0,'LineWidth',5,'MaxHeadSize',.5,'Color',[0 1 0]);
        if p == 2
            text(A(1,ii),A(2,ii),sprintf('(%.2f,%.2f)',coords(1,ii),coords(2,ii)),'FontSize',14);
        elseif p == 1
            text(A(1,ii),A(2,ii),sprintf('(%.2f)',coords(1,ii)),'FontSize',14);
        end
    end
end

if m == 3
    figure; hold on;
    view([-37.5,30]);
    scatter3(0,0,0,'b*','LineWidth',3);
    axis equal
    all_vecs = [A basis];
    max_dim = max(max(abs(all_vecs)));
    xlim([-max_dim max_dim])
    ylim([-max_dim max_dim])
    zlim([-max_dim max_dim])
    xlabel('x1','FontSize',14)
    ylabel('x2','FontSize',14)
    zlabel('x3','FontSize',14)
    title('Coordinates','FontSize',16)
    
    for ii = 1:p
        quiver3(0,0,0,basis(1,ii),basis(2,ii),basis(3,ii),1.0,'LineWidth',3,'MaxHeadSize',.5,'Color',[1 0 0]);
        text(basis(1,ii),basis(2,ii),basis(3,ii),sprintf('b%d',ii),'FontSize',20);
    end
    
    for ii = 1:n
        quiver3(0,0,0,A(1,ii),A(2,ii),A(3,ii),1.0,'LineWidth',5,'MaxHeadSize',.5,'Color',[0 1 0]);
        if p == 3
            text(A(1,ii),A(2,ii),A(3,ii),sprintf('(%.2f,%.2f,%.2f)',coords(1,ii),coords(2,ii),coords(3,ii)),'FontSize',14);
        elseif p == 2
            text(A(1,ii),A(2,ii),A(3,ii),sprintf('(%.2f,%.2f)',coords(1,ii),coords(2,ii)),'FontSize',14);
        elseif p == 1
            text(A(1,ii),A(2,ii),A(3,ii),sprintf('(%.2f)',coords(1,ii)),'FontSize',14);
        end
    end
end


%%%
%%% Test Cases
%%%
% 1) A = randi([-10 10],2,6); 
% 2) A = randi([-10 10],3,6);
% 3) A = [-2 -2;1 3;0 4];
% 4) A = [-1 3 -1 -6 -1 1;3 -9 4 21 2 -5;2 -6 4 18 0 -6];
% 5) A = [1 -1 3 2;2 -2 6 4];
% 6) A = [8 1 7;8 6 2;4 8 -4;6 10 -4;1 2 -1];


% 1)
%
% A =
% 
%      5     1    -9     6    -8    -1
%     -3    -9     1     9     1   -10
%     
% basis =
% 
%     1.8478    4.2826
%    -2.4710   -5.1838
% 
% 
% coords =
% 
%   -13.0209   33.2319   42.2088  -69.3792   37.0449   47.8259
%     6.7855  -14.1048  -20.3130   31.3355  -17.8515  -20.8686
%
% Dimension: 2
    

% 2)
% 
% A =
% 
%      1    -5     5    -6     7    -9
%     -7     3    -1     9     1    -1
%      2     4    -9    -7    10    -8
%      
% basis =
% 
%     4.8133   -3.1040    3.1008
%    -7.4943   -3.1995   -2.8189
%    -5.0319    4.3495   -5.3616
% 
% 
% coords =
% 
%     1.2464   -1.1484   -0.2498   -4.7078    5.4636   -5.7650
%     0.3660    0.8514   -0.4595    1.8494   -4.0526    4.5107
%    -1.2458    1.0224    1.5403    7.2242  -10.2803   10.5618
% 
% 
% Dimension: 3


% 3)
%
% A =
% 
%     -2    -2
%      1     3
%      0     4
%      
% basis =
% 
%    -2.6841   -0.8913
%     3.1634    0.9733
%     3.6426    1.0552
% 
% 
% coords =
% 
%    -5.0937    3.5112
%    17.5834   -8.3300
%
% Dimension: 2


% 4)
%
% A =
% 
%     -1     3    -1    -6    -1     1
%      3    -9     4    21     2    -5
%      2    -6     4    18     0    -6
%      
% basis =
% 
%    -0.2816   -1.4490
%     0.9809    4.9267
%     0.8354    4.0574
% 
% 
% coords =
% 
%   -17.0935   51.2805   25.6325   25.6169  -59.8195  -68.3584
%     4.0122  -12.0366   -4.2914   -0.8378   12.3158   12.5951     
%
% Dimension: 2

% 5)
%
% A =
% 
%      1    -1     3     2
%      2    -2     6     4
%      
% basis =
% 
%     0.5499
%     1.0997
% 
% 
% coords =
% 
%     1.8186   -1.8186    5.4559    3.6373     
%
% Dimension: 1
         
% 6)
%
% 
% A =
% 
%      8     1     7
%      8     6     2
%      4     8    -4
%      6    10    -4
%      1     2    -1
%      
% basis =
% 
%     2.0127    5.3274
%     6.2778    7.0822
%     7.4041    5.2958
%     9.4000    7.2419
%     1.8510    1.3240
% 
% 
% coords =
% 
%    -0.7315    1.2966   -2.0281
%     1.7780   -0.3021    2.0802
% 
% Dimension: 2




% We expect, mathematically, that basiscoords = A. However, if you try the 
% command A - (basiscoords)in MATLAB, you may not get all zeros. Why?

% This is because of the rounding errors.



