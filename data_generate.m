% Input:
%     k          the number of clusters 
%     n          the number of observation in each cluster
%     sigma_0    the standard deviation for the centers
%     sigma_1    the standard deviation for each cluster
% Output:
%     data       a vector. 
function [data] = data_generate(k, n, sigma_0, sigma_1)

if nargin < 3
    sigma_0 = 4;
end
if nargin < 4
    sigma_1 = 1;
end

centers = randn(1, k) + -8 : sigma_0 : (-8 + sigma_0 * (k));

data = zeros(1, n*k);
for j = 1:k
    data(((j-1)*n+1) : (j*n)) = randn(1, n) * sigma_1 + repmat(centers(j), 1, n);
end

hist(data, 50)