% Output:
%     ix         a vector. Its length is the number of the observations.
function centers = DP_marginal(data, alpha, sigma_0, sigma_1, maxIter)
if nargin < 2
    alpha = 1;
end
if nargin < 3
    sigma_0 = 1;
end
if nargin < 4
    sigma_1 = 4;
end
if nargin < 5
    maxIter = 500;
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
        for j  = 1:size(tb, 1) + 1
            if j <= size(tb, 1)
                probs(j) = tb(j,2) * normpdf(data(i), tb(j,1), sigma_0);
            else
                probs(j) = alpha / 2 / pi / sigma_1 * exp(-1/2 * data(i)^2 * (2 * sigma_1^2 + 1) / (sigma_1^2 + 1));
            end 
        end
        probs = log(probs);
        probs = probs - max(probs);
        probs = exp(probs);
        probs = probs / sum(probs);
        [~,~,ix] = histcounts(rand(1), [0, cumsum(probs)]);
        if ix > size(tb, 1)
            centers(i) = data(i);
        else
            centers(i) = tb(ix);
        end
    end
    fprintf(['Iter ', num2str(iter), ' done\n'])
end
            


