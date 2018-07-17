##Akteurs- und Netzwerkmasse des Semesternetzwerks

## Semesternetzwerk

*library(igraph)*

el <- read.csv("https://raw.githubusercontent.com/hdm-crpr/226305/master/data/students/edges.csv", header=T, as.is=T, sep=",")
nl <- read.csv("https://raw.githubusercontent.com/hdm-crpr/226305/master/data/students/nodes.csv", header=T, as.is=T, sep=",")
elmat <- as.matrix(el)
semester <- graph_from_data_frame(d=elmat, vertices=nl, directed=T)
semester
plot(semester, layout=layout_with_kk, edge.arrow.size = 0.5)
