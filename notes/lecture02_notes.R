### Lecture 02

# From bag of 4 marbles, ways to produce proportions
# from 1/4 to 3/4
ways <- c(3, 8, 9)

# Normalized ways = plausibility
plausibility <- ways/sum(ways)

plausibility

# Get quadratic from multiplying 2 diagonal lines
# representing the relative plausibilities
# of 2 events
plot(0:10 * 10:0)

plot(10:0 * 0:10 * 10:0)
