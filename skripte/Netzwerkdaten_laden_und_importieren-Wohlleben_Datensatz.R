# Netzwerkdaten laden und importieren
## Daten einlesen
### Wohlleben-Datensatz

# Laden Sie sich zunächst die Edgelist (wohl_edge_csv) und die Nodelist (wohl_node) von GitHub oder Moodle herunter und speichern Sie die Dateien in Ihrem Working Directory.

edges <- read.csv("wohl_edge.csv", header=T, as.is=T) # Liest die Edgelist ein und ordnet sie der Variablen edges zu.
edges # Zeigt die Daten aus der CSV Datei in der Konsole an.
head(edges) # Zeigt lediglich die ersten Zeilen des Datensatzes an.

noes <- read.csv("wohl_node.csv", header=T, as.is=T) # Liest die Nodelist ein und ordnet sie der Variablen nodes zu.
nodes # Zeigt die Daten aus der CSV Datei in der Konsole an.
head(nodes) # Zeigt lediglich die ersten Zeilen des Datensatzes an.

# Die Edgelist liegt als Data frame vor. Um ein igraph Objekt definieren zu können, muss die Edgelist jedoch als Matrix vorliegen.

ties <- as.matrix(edges) # Wandelt die Edgelist in eine Matrix um und ordnet sie der Variablen ties zu.

# Jetzt können wir ein igraph Objekt erstellen. Wenn wir die Nodelist nicht miteinbeziehen wollen, nutzen wir den folgenden Befehl.

wohled <- graph_from_edgelist(ties, directed=FALSE) # Das Wohlleben Netzwerk ist ungerichtet. Wäre es gerichtet, stünde nach directed TRUE. Der Variablenname setzt sich zur besseren Wiedererkennung aus wohl[leben] und ed[gelist] zusammen.
wohled # Zeigt das igraph Objekt wohled an.

# Wollen wir ein igraph Objekt erstellen, das die Daten der Nodelist integriert, nutzen wir den folgenden Befehl.

wohledno <- graph_from_data_frame(d=ties, vertices=nodes, directed=F) # Wohl[leben], ed[gelist] und no[delist]. Man kann den Namen der Variable natürlich frei wählen.

# Beide Netzwerke können visualisiert werden.

plot(wohled, vertex.size=degree, vertex.label=NA, edge.arrow.width=0.4)

plot(wohledno, vertex.size=degree, vertex.label=NA, edge.arrow.width=0.4)

# Sie sehen genau gleich aus. Aber zwischen ihnen besteht ein Unterschied. Wir dürfen nicht vergessen, dass wohledno viel mehr Daten (aus der integrierten Nodelist) liefert. Das sieht man anhand des folgenden Befehls.

list.vertex.attributes(wohled)

list.vertex.attributes(wohledno)

# Lassen wir uns nämlich die Knotenattribute auflisten, sehen wir, dass wohledno natürlich viel mehr Attribute besitzt, da es überhaupt eine Nodelist gibt.

### Für Fortgeschrittene

# Mit dem Informationen der Nodelist können wir in wohledno die Personen und Organisationen unterschiedlich visualisieren.

V(wohledno)[V(wohledno)$type == 1]$shape <- "square" # Alle Knoten, die beim Attribut type den Wert 1 annehmen, werden als Quadrat dargestellt.

V(wohledno)[V(wohledno)$type == 0]$shape <- "circle" # Alle Knoten, die beim Attribut type den Wert 0 annehmen, werden als Kreis dargestellt.

# Wie man sieht, lohnt es sich oft, eine Nodelist zu importieren, wenn die Daten einen Mehrwert bieten.

