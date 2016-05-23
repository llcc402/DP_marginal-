# The marginal DP posterior sampler

1. The model is:

                x_i     \sim   \theta_i,    i = 1,...,n
                theta_i \sim   \mu,         i = 1,...,n
                \mu     \sim   DP(\alpha, N(0,3))

2. Given \theta_{1:n-1} and x_{1:n}, the probability of \theta_n is 

    p(d\theta_n \in d\theta) = \alpha N(d\theta|0,3)f(x_i|\theta_i) + \sum n_i delta_{\theta_j^*}(d\theta)

3. Using the above equation for the update of \theta_n directly is slow. The reason is that there are a group of observations attached to the same \theta_j^* but the algorithm can only move these \theta_i (attaching to \theta_j^*) one by one. 

