

function Vnew = transform_mesh(A,V,T,C)
% TRANSFORM_MESH applies a linear transformation to a triangle mesh.
%
% Function TRANSFORM_MESH takes inputs A,V,C, and optionally C, computes
% the transformed vertex matrix Vnew, and uses trisurf to plot both the
% original and transformed objects on the same set of axes.
%
% Define variables
% 
% Inputs:
% A: This is a 3x3 matrix.
% V: This is a matrix with 3 columns that shows the different combinations
%    of coordinates. Each row of V represents a vertex in R3.
% T: This is a matrix with 3 or 4 columns that shows the different
%    combinations of vertices.
% C: This is an optional input; it is a matrix with 3 columns.
%
% Output:
% Vnew: plot of both the original and transformed objects on the same set
% of axes.

% Homework Program 7
%
% Name: Kim, TaeWon
% Section: 30
% Date: 11/6/2016


if ~ismatrix(A) || size(A,1) ~= 3 || size(A,2) ~= 3 || isempty(A)
    error('A must be a 3x3 matrix.');
end

if ~ismatrix(V) || size(V,2) ~= 3 || isempty(A)
    error('V must be a matrix with 3 columns.');
end

if ~ismatrix(T) || isempty(A) || size(V,2) ~= 3 && size(V,2) ~= 4
        error('T must be a matrix with 3 or 4 columns.');
end

% Step 8: Apply linear transformation represented by matrix A
% to each vector in V, and store the results in the matrix Vnew (same size
% as V). Each ROW of V represents a vertex (use transpose operator).

Vnew = A * V';

Vnew = Vnew';


% Plot the new and original meshes 

if nargin < 4 
    % User did not provide specific colors
    trisurf(T(:,1:3),Vnew(:,1),Vnew(:,2),Vnew(:,3)); 
    hold on 
    trisurf(T(:,1:3),V(:,1),V(:,2),V(:,3), ... 
        'EdgeColor','none','FaceAlpha',0.2); 
    hold off 
else 
    % User provided specific colors 
    trisurf(T(:,1:3),Vnew(:,1),Vnew(:,2),Vnew(:,3),T(:,4)); 
    hold on 
    trisurf(T(:,1:3),V(:,1),V(:,2),V(:,3),T(:,4), ...
        'EdgeColor','none','FaceAlpha',0.2); 
    hold off 
    colormap(C); 
end


% Find the matrix representing scaling by a factor of 0.5 in the
% x-direction and 1.5 in the y and z direction, and store in the variable
% A_sclale.

% A_scale = [0.5 0 0;0 1.5 0;0 0 1.5];

% Find the matrix representing reflection across the xy-plane, and store it
% in the variable A_refl

% A_refl = [1 0 0;0 1 0;0 0 -1];

% Find the matrix representing rotation by 60 degrees about the axis
% defined by the line going through the origin and the vector [1;1;0] and
% store it in the variable A_rot.

% A_rot = vrrotvec2mat([1 1 0 pi/3]);

% Find the matrix representing the combined transformation of going through
% the rotation, reflection then scaling. Store the matrix in the variable
% A.

% A = A_scale * A_refl * A_rotate

% Find the matrix representing the combined transformation of first going
% through the reflection, then scaling, then rotation. Store the matrix in
% the variable B.

% B = A_rot * A_scale * A_refl

% A_scale =
% 
%     0.5000         0         0
%          0    1.5000         0
%          0         0    1.5000
%          
% 
% A_refl =
% 
%      1     0     0
%      0     1     0
%      0     0    -1
%      
% A_rot =
% 
%     0.7500    0.2500    0.6124
%     0.2500    0.7500   -0.6124
%    -0.6124    0.6124    0.5000
% 
% A =
% 
%     0.3750    0.1250    0.3062
%     0.3750    1.1250   -0.9186
%     0.9186   -0.9186   -0.7500
%    
% B =
% 
%     0.3750    0.3750   -0.9186
%     0.1250    1.1250    0.9186
%    -0.3062    0.9186   -0.7500
   
   
   