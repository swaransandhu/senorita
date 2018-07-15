### Beispiel Karate Netzwerk Visualisierung

library(igraph)
library(igraphdata)
plot(karate)

vertex_attr(karate, "color")
vertex_attr(karate, "Faction")

karate_new <- delete_vertex_attr(karate, "color")

farbe <- c("red", "green") # Wir legen jetzt eine Farbskala an, die genau zwei Farben umfasst
V(karate_new)$color <- farbe[V(karate_new)$Faction] # Diese Farbskala wenden wir auf die Funktion color an und zwar für die Spalte Faction
plot(karate_new)

farbe <- c("gold", "lightgreen")
V(karate_new)$color <- farbe[V(karate_new)$Faction]
plot(karate_new)

farbe <- c("gold", "lightgreen")
V(karate_new)$color <- farbe[V(karate_new)$Faction]
plot(karate_new, vertex.size=degree(karate), vertex.label=NA)

deg <- degree(karate, mode="all") # Berechnet das Degree-Maß von allen Knoten
V(karate)$size <- deg # Weist dem Vektor Size die Berechnung des Degree-Maßes zu
plot(karate, vertex.size=deg)

edge.attributes(karate_new)$weight

E(karate_new)$width <- E(karate_new)$weight/2
plot(karate_new)