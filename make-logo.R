make_normal_plot = function(thickness = 7) {
  par(bg = NA, mar = c(0, 0, 0, 0)) 
  plot(
    1,
    type = "n",
    xlab = "",
    ylab = "",
    xlim = c(-1, 10),
    ylim = c(0, 0.56),
    axes = FALSE,
    frame.plot = FALSE
  )
  curve(dnorm(x, mean = 6, sd = sqrt(0.5)), col = "#666666", add = TRUE, lwd = thickness, n = 10000)
  curve(dnorm(x, mean = 5, sd = sqrt(1)), col = "#888888", add = TRUE, lwd = thickness, n = 10000)
  curve(dnorm(x, mean = 4, sd = sqrt(2)), col = "#999999", add = TRUE, lwd = thickness, n = 10000)
}

dev.off()
png("public/wordmark.png", width = 1000, height = 400)
make_normal_plot()
dev.off()

dev.off()
png("public/wordmark-favicon.png", width = 700, height = 500)
make_normal_plot(thickness = 7)
dev.off()





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

