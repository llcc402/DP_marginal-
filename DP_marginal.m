% Output:
%     ix         a vector. Its length is the number of the observations.
function ix = DP_marginal(data, alpha, sigma_0, sigma_1, maxIter)
if nargin < 2
    alpha = 1;
end
if nargin < 3
    sigma_0 = 1;
end
if nargin < 4
    sigma_1 = 4;
end

% init all observations to be in the same cluster
ix = ones(1, length(data)); 

% init centers
centers = zeros(1, length(data)) + mean(data);

for iter = 1:maxIter
    for i = 1:length(data)
        % remove the i-th center
        cc = centers;
        cc(i) = [];
        
        % the first column of tb is the centers and the second column is the
        % corresponding frequencies
        tb = tabulate(cc);
        probs = zeros(1, size(tb,1) + 1);
        for j  = 1:size(tb, 1)
            probs(j) = 


