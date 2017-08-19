thickness = 5
dev.off()
par(bg=NA) 
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
curve(dnorm(x, mean = 4, sd = sqrt(2)), col = "darkorange", add = TRUE, lwd = thickness)
curve(dnorm(x, mean = 5, sd = sqrt(1)), col = "dodgerblue", add = TRUE, lwd = thickness)
curve(dnorm(x, mean = 6, sd = sqrt(0.5)), col = "grey", add = TRUE, lwd = thickness)

# http://realfavicongenerator.net/