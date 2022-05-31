### Lecture 02

# From bag of 4 marbles, ways to produce proportions
# from 1/4 to 3/4, if we observe 2 Water, 1 Land
ways <- c(3, 8, 9)

# (from garden of forking paths)


# Normalized ways = plausibility
plausibility <- ways/sum(ways)

plausibility

# Get quadratic from multiplying 2 diagonal lines
# representing the relative plausibilities
# of 2 events
plot(0:10 * 10:0)

plot(10:0 * 0:10 * 10:0)

# Can also get ways from binomial probability function:
W <- 6
L <- 3
p <- 0.7

# Given 6 observations of W and 3 of L, 
# computes the number of ways to realize W,L given p (prop. of Water) = 0.7
dbinom(W, W+L, p) 


# From bag of marbles example
W <- 2
L <- 1
# 1) For each possible value of p
p_seq <- seq(from = 0.25, to = 0.75, by = 0.25)
# 2) Compute product Pr(W,L|p)Pr(p)
prob_p <- rep(1, length(p_seq))
prob_LW_given_p <- dbinom(W, W+L, p_seq)
product <- prob_LW_given_p * prob_p
# 3) Relative sizes of products in 2) are posterior probs
posterior <- product / sum(product)

# Note resulting vector same as previous plausibility vector
posterior

## Grid Approximation
# create grid
p_grid <- seq(from=0, to=1, length.out=1000)
# set prior uniformly
prob_p <- rep(1,1000)
# alt prob_p
alt_prob_p <- dbeta(p_grid, 3, 1)
prob_data <- dbinom(6, size=9, prob=p_grid)
posterior <- prob_data * prob_p
posterior <- posterior / sum(posterior)

plot(p_grid)
plot(prob_p)
plot(alt_prob_p)
plot(posterior)

## Sample from posterior
samples <- sample(p_grid, prob = posterior,
                  size = 1e4, replace = TRUE)
plot(samples)
plot(density(samples))

w <- rbinom(1e4, size = 9, prob = samples)


