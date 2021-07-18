library("dbscan")

data("iris")
x <- as.matrix(iris[, 1:4])

db <- dbscan(x, eps = .4, minPts = 4)

hdb <- hdbscan(x, minPts = 4)
hdb

plot(hdb, show_flat = T)


colors <- mapply(function(col, i) adjustcolor(col, alpha.f = hdb$membership_prob[i]), 
                 palette()[hdb$cluster+1], seq_along(hdb$cluster))
plot(x, col=colors, pch=20)
