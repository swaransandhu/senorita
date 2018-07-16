##Akteurs- und Netzwerkmaße des Semesternetzwerks

## Semesternetzwerk

library(igraph)

el <- read.csv("https://raw.githubusercontent.com/hdm-crpr/226305/master/data/students/edges.csv", header=T, as.is=T, sep=",")
nl <- read.csv("https://raw.githubusercontent.com/hdm-crpr/226305/master/data/students/nodes.csv", header=T, as.is=T, sep=",")
elmat <- as.matrix(el)
semester <- graph_from_data_frame(d=elmat, vertices=nl, directed=T)
semester
plot(semester, layout=layout_with_kk, edge.arrow.size = 0.5)

## Netzwerkmaße

### Dichte

edge_density(semester)
simplesemester <- simplify(semester, remove.multiple = TRUE)
edge_density(simplesemester)

### Triaden

triad_census(semester)

### Cliquen

cliques(semester, min="3", max="3")

largest_cliques(semester)

max_cliques(semester)

### Pfaddistanz

distances(semester, v = V(semester), to = V(semester))

farthest_vertices(semester)
farthest_vertices(semester, directed=FALSE)

mean_distance(semester)
mean_distance(semester, directed=FALSE)

### Durchmesser

get_diameter(semester)
get_diameter(semester, directed=FALSE)

## Akteursmaße

### Degree

degree(semester)
degree(semester, mode="in")
degree(semester, mode="out")

degree(semester, normalized = TRUE)

### Betweenness

betweenness(semester)

### Closeness

closeness(semester) #Funktioniert nicht für unverbundene Graphen!