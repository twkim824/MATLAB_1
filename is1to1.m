function y = is1to1(A)
% is1to1 checks whether a transformation is one-to-one

[m,n] = size(A);

[R,piv] = rref(A);


% Check if there is a pivot in every column
if length(piv) == n
    y = 1;
else
    y = 0;
end
