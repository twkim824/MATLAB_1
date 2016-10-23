function [E,Image] = mandelbrot(limits, nx, ny, max_esctime)
% MANDELBROT computes visualizations of the Mandelbrot set.
%
% Function MANDELBROT displays an array containing the real escape times
% for each pixel and an array containing the color data for the image.
%
% Calling sequence:
% [E Image] = mandelbrot(limits, nx, ny, max_esctime)
%
% Define variables:
%
% limits: This is a 4-element vector specifying a rectangular region in the
% complex plain. It has the form [XMIN XMAX YMIN YMAX], where XMIN and XMAX
% are the minimum and maximum real parts and YMIN and YMAX are the minimum
% and maximum imaginary parts. For example, [-1 2 -2 3] specifies a
% rectangular region in the complex plane with -1-2i as the lower left
% corner and 2+3i as the upper right corner. This is similar to the input
% to the AXIS function. Default is [-2.0 0.5 -1.2 1.2].
%
% nx: The number of points (pixels) in the x-direction. Defaults is 1000.
%
% ny: The number of points (pixels) in the y-direction. Defaults is 1000.
%
% max_esctime: The maximum number of iterations in the sequence allowed
% when calculating the escape times. This will be the maximum effective
% integer escape time. Defaults is 1000.
%
% E: An ny-by-nx array containing the real escape times for each pixel.
%
% Image: An array containing the color data for the image.


% Homework Program 4
%
% Name: Kim, TaeWon
% Section: 30
% Date: 13/10/16

if ~exist('nx','var') || isempty(nx)
    nx = 1000;
end
    
if ~exist('ny','var') || isempty(ny)
    ny = 1000;
end

if ~exist('max_esctime','var') || isempty(max_esctime)
    max_esctime = 1000;
end

if ~exist('limits','var') || isempty(limits)
    limits = [-2 0.5 -1.2 1.2];
end
    
x = linspace(limits(1),limits(2),nx);
y = linspace(limits(4),limits(3),ny);
[X,Y] = meshgrid(x,y);
C = X + 1i*Y;    
    
    
% Initialization
E = zeros(ny,nx);
Z = zeros(ny,nx);
k = 0;
done = false([ny nx]);

while k < max_esctime && all(done(:)) == 0
    
    Z = Z.^2 + C;
    
    k = k + 1;
    
    new = abs(Z) > 2 & done == false;
    
    E(new) = k - log(log2(abs(Z(new))));
    
    done = done + new;
    
end
    
% Plot result as a color image

Image = show_mandelbrot(E,limits);
    
    
   
    
    