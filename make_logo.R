thickness = 6
dev.off()
par(bg = NA) 
plot(
  1,
  type = "n",
  xlab = "",
  ylab = "",
  xlim = c(0, 10),
  ylim = c(0, 0.61),
  axes = FALSE,
  frame.plot = FALSE
)
curve(dnorm(x, mean = 6, sd = sqrt(0.5)), col = "#666666", add = TRUE, lwd = thickness)
curve(dnorm(x, mean = 5, sd = sqrt(1)), col = "#888888", add = TRUE, lwd = thickness)
curve(dnorm(x, mean = 4, sd = sqrt(2)), col = "#999999", add = TRUE, lwd = thickness)





set.seed(42)

thickness = 5
dev.off()
par(bg = NA) 
plot(
  x = rnorm(100),
  y = rnorm(100),
  xlab = "",
  ylab = "",
  axes = FALSE,
  frame.plot = FALSE,
  pch = 20
)

