x1 = randn(1, 100) - 4;
x2 = randn(1, 100) + 4;

data = [x1, x2];

centers = DP_marginal(data, 5);
