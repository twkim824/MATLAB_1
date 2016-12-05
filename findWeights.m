function c = findWeights(A,b)
% This function finds the coordinates of vector b with respect to the
% basis created by the columns of A. 

[m,n] = size(A);

flag = 0;

for ii = 1:n
    for jj = ii+1 : n
        d = A(:,ii)' * A(:,jj);
        if d ~= 0
            flag = 1;
        end
    end
end


c = zeros(n,1);

if flag == 0
    % If columns of A are orthogonal, can use simplified coordinates
    fprintf('Orthogonal basis!\n');
    for ii = 1:n
        c(ii) = (b' * A(:,ii)) / (A(:,ii)' * A(:,ii));
    end
    
else
    % If columns of A are not orthogonal, use row reduction to
    % find the coordinates
    fprintf('Not orthogonal basis!\n');
    R = rref([A b]);
    c = R(1:n,end);
end
