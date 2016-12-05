function A_inv = findInv(A)
% Finds the inverse of a matrix by row reduction.

[m,n] = size(A);

if m ~=n
    error('Matrix must be a square!\n');
end

[R,piv] = rref(A);

% There must be a pivot in every column.
if length(piv) ~= n
    error('Matrix is not invertible!\n');
end

B = rref([A eye(n)]);

A_inv = B(:,n+1:end);