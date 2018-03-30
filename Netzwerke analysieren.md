# Netzwerke analysieren
In Lektion 5 lernen Sie, wie man Netzwerke für die Analyse vorbereitet.
## Einführung Zachary Datensatz
Wir arbeiten zunächst mit dem Zachary Datensatz: karate, der bereits im igraphdata Paket hinterlegt ist. Er muss also nicht eingelesen werden, sondern kann direkt aufgerufen werden.

`> library(igraph) # lädt das igraph Paket`

`> library(igraphdata) # lädt die Datensätze aus dem igraphdata Paket`

`> data(karate) # lädt den Datensatz karate`

`> karate # zeigt das igraph Objekt karate an`

`> ?karate # liefert Hintergrundinformationen zum Datensatz`

`> plot(karate) # liefert eine erste Visualisierung`

Wie bei allen Netzwerken ist es wichtig, den Hintergrund des Datensatzes zu verstehen:

`> # seit der igraph Version 1.1.3 lässt sich alternativ der Datensatz auch bequem über den Befehl make_graph laden!`

`> library(igraph) # lädt das igraph Paket`

`> z <- make_graph("Zachary") # lädt den gleichen Datensatz wie oben (also Variable z)`

`plot(z) # kleine Visualisierung`

### Eine kleine Geschichte von Zachary's Karate Club (1977)

Wayne Zachary ist Anthropologe und interessierte sich für den Zusammenhalt in kleinen Gruppen. Für seinen 1977 publizierten Aufsatz: **An Information Flow Model for Conflict and Fission in Small Groups ([PDF](http://www1.ind.ku.dk/complexLearning/zachary1977.pdf)) hat er über den Zeitraum von drei Jahren (1970 bis 1972) den Karate-Club einer Universität untersucht. Innerhalb des Clubs gibt es einen schwelenden Konflikt zwischen dem Teilzeit-Karatelehrer "Mr. Hi" und dem Präsident des Clubs, "John A.". Beispielsweise will Mr. Hi die Preise für seine Stunden selbst festlegen, während der Präsident daran interessiert ist, die Kosten für die Mitglieder möglichst gering zu halten.

Im Laufe der Zeit wurde aus dieser eher kleinen Angelegenheit eine ideologische Kampflinie. Für die eine Gruppe war Mr. Hi ein weiser Mentor und eine Vaterfigur, der sich um seine Schüler kümmert. Für die Anhänger des Präsidenten war Mr. Hi ein Angestellter, der versucht, höhere Preise auf dem Rücken aller Mitglieder zu erlangen.

Der Konflikt hatte seinen Preis und führte zu einem Zerwürfnis zwischen den Gruppenmitgliedern. Ungefähr die Hälfte der Gruppe folgte Mr. Hi in seinen neuen Club während die andere Hälfte bei John A im bestehenden Club blieb.

Zachary wollte herausfinden, wie es zu diesem Bruch kommen konnte. Deshalb hat er die Freundschaftsbeziehungen von 34 Clubmitgliedern erhoben, die sich in 78 Relationen abzeichnen. Dazu hat er acht unterschiedliche Dimensionen der Beziehungen analysiert:

1. Beziehugen in und zwischen den akademischen Kursen an der Universität.
2. Mitgliedschaft im privaten Karate-Club von Mr. Hi, wo Mr. Hi zusätzlich unterrichtet.
3. Mitgliedschaft im privaten Karate-Club von Mr. Hi, wo viele seiner Unterstützer am Wochenende trainieren.
4. Studenten unterrichten im Karate-Studio, das zuvor erwähnt wurde.
5. Interaktion im Ratskeller der Universität, der im gleichen Keller wie der Karate-Club angesiedelt ist.
6. Interaktion in einer studentischen Kneipe gegenüber des Campus
7. Teilnahme an Karate Wettbewerben, die von privaten Karate-Studios organisiert wurden.
8. Teilnahme an universitären Karate-Wettbewerben. Diese wurden – wie die privaten – ebenfalls samstags ausgetragen. Von daher ist die Teilnahme nur an einer Art Wettbewerb möglich.

Diese Interaktionsräume wurden nun in einer Skala addiert: Je mehr Interaktionen stattfinden, desto höher ist die Wahrscheinlichkeit für eine Freundschaft.

Quelle: Zachary, W.W. (1977): An information flow model for conflict an fission in small groups. Journal of Anthropological Research 33, 452-473. https://www.jstor.org/stable/3629752
## Knoten und Kantenattribute einsetzen
Um die Attribute in einem igraph Objekt besser zu verstehen, verwenden wir die Befehle **V()** für Vertex-Attribute und **E()** für Edge-Attribute.

`> list.vertex.attributes(karate)`

`> list.edge.attributes(karate)`

`> # prüft zunächst alle Vertex- bzw. Edge-Attribute, die ggf. für eine Analyse interessant sein könnten`

Mit dem **§** Attribut wird ausgewählt, welches Attribut angezeigt werden soll.

`> V(karate)$name`

Mit V(karate)$name werden alle Vertex-Attribute aus dem Feld "**name**" ausgelesen. Dabei wird deutlich, dass bis auf Mr. Hi und John A alle Akteure anonymisiert sind.

Das Attribut **faction** gibt an, wer sich nach dem Bruch welcher Fraktion zugeordnet hat. Es ist ein numerisches Attribut, deshalb ist es als /n angegeben und nimmt den Wert 1 oder 2 an. 1 ist die Fraktion um John A, 2 ist die Fraktion um den Karate Trainer Mr. Hi.

**Label** ist ein Vertex-Attribut, das im Gegensatz zur ID jedem Knoten eine Bezeichnung zuweist. Das ist vor allem für eine schöne Visualisierung hilfreich.

**Color** entspricht dem Vertex-Attribut der Faction. Es dient dazu, dass die Knoten eindeutig eingefärbt werden können. Das ist dann sinnvoll, wenn man diese Eigenschaft weiter manipulieren möchte. Die Werte sind allerdings mit denen des Attributs "Faction" identisch.

Das Edge-Attribut **weight** gibt das Gewicht der 78 Beziehungen an und ist ein numerisches Attribut, das von 1 bis maximal 7 reicht. Je höher die Zahl ausfällt, desto mehr überlappende Interaktionsmöglichkeiten gab es zwischen den beiden Akteuren.

**Tipp:** Einfach für die wichtigsten Variablen Werte zuweisen, dann können sie schneller aufgerufen und weiter verwendet werden.

`> # Vertex-Attribute vereinfachen`

`> name <- V(karate)$name`

`> label <- V(karate)$name`

`> color <- V(karate)$color`

`# das gleiche gilt genauso für die Edge-Attribute`

`> gewicht <- E(karate)$weight # als Beispiel hier mit einer deutschen Bezeichnung`

Wir können jetzt den Datensatz beispielsweise nach den Gruppen aufteilen:

`> f1 <- V(karate)$Faction == "1" # nur die Werte mit 1`

`> f2 <- V(karate)$Faction != "1" # alle Werte ungleich 1, alternativ wäre auch == "2" möglich gewesen`

Damit wird ein Vektor generiert, der den Datensatz nach dem Argument, das genannt wurde – in diesem Fall 1 oder 2 – logisch unterteilt.


Zudem lassen sich einzelne Knoten herausgreifen:

`> mrhi <- V(karate)[label == "H"]`

Wir haben jetzt den Knoten mit dem Label "H" der Variable mrhi zugewiesen. Damit lassen sich einzelne Knoten, aber auch Gruppen, basierend auf einem Attributswert zusammenfassen.

Wir können jetzt fragen, welche Knoten um Mr. Hi herum angesiedelt sind. Dazu verwenden wir den Befehl "adj" für adjacent. Dieser bezieht sich auf die Kanten des Netzwerks karate.

`> E(karate)[ adj(mrhi) ]`

Dazu wird ein Vektor E aus den Edges des Datensatzes karate erzeugt, die direkt an mrhi anschließen. Mit dem igraph Skript sieht man, dass 16 von 78 Beziehungen direkt am Mr Hi angrenzen.

Einfacher ist es, mit dem Befehl "**incident()**" einen einzelnen Knoten ins Zentrum der Analyse zu stellen und andere auszublenden. incident() für einen Knoten oder incident_edges() für mehrere Knoten selektiert jede Kante, die mit einem Knoten V verbunden ist. Achtung: Damit werden keine Teilnetzwerke erstellt, sondern nur die Werte für einzelne Knoten berechnet.

`> hi <- incident(karate, V(karate)[name == "Mr Hi"], mode = "all")`

`> hi`

Wir sehen: Das Ergebnis ist das gleiche wie im ersten Verfahren, aber die Analyse ist deutlich einfacher und schneller.

### Hervorhebung eines einzelnen Knotens in der Visualisierung

Damit ein Knoten und seine direkt verbundenen Kanten visualisiert und damit hervorgehoben werden können, sind einige einfache Schritte in R notwendig. Das untenstehende Skript zeigt, wie das am Beispiel von Mr. Hi funktioniert.

`> ecol <- rep("grey80", ecount(karate)) # alle Kanten in Grauton 80% Deckung`

`> ecol(hi) <- "orange" # alle Kanten von "Mr Hi" in orange`

`> vcol <- rep("grey40", vcount(karate)) # alle Knoten in Grauton 40% Deckung`

`> vcol[V(karate)$name == "Mr Hi"] <- "gold" # Knoten von Mr Hi in gold`

`> V(karate)$label <- NA # optional blenden wir damit die labels der Knoten aus`

Mit colours() lassen sich übrigens alle Farben anzeigen, die euch in R zur Verfügung stehen.

`> plot(karate, vertex.color=vcol, edge.color=ecol) # wichtig ist, dass sich die Visualisierung auf die zuvor angelegten Visualisierungsparameter beziehen.

![Visualisierung der direkten Kanten von Mr. Hi](Link zum Bild)

## Teilnetzwerke bilden
In vielen Fällen ist es sinnvoll, bestimmte Untergruppen aus einem Gesamtnetzwerk isoliert anzuschauen. Diese Untergruppen lassen sich leicht mit dem Befehl **subgraph()** herausarbeiten. Wir arbeiten hier wieder mit dem Zachary-Karate Netzwerk.

Wir wollen jetzt aus unserem Karate Netzwerk nur die Gruppe mit der **Faction = 1** behalten. Wir können dazu entweder die Knoten, bei denen das Attribut Faction den Wert 1 annimmt, behalten oder alle anderen Knoten, die nicht der Faction 1 angehören, löschen. Mit dem logischen Operator "!" kann man definieren, dass etwas ungleich x ist. 2 != 1 bedeutet z.B., dass 2 ungleich 1 ist. Wenn wir also bestimmen wollen, dass alle Knoten, deren Attribut Faction **nicht** den Wert 1 annimmt, gelöscht werden sollen, setzen wir das Attribut Faction ungleich 1. Dazu müssen wir einen neuen Subgraphen anlegen:

`> karate1 <- delete_vertices(karate, V(karate)[Faction != "1"])`

`> plot(karate1)`

Übrig bleiben jetzt alle Knoten, deren Attribut Faction den Wert 1 annimmt, also das Netzwerk um Mr. Hi.

Es gibt aber noch einen anderen Weg, um das Netzwerk zu reduzieren. Wir wollen jetzt nicht Knoten löschen, wie oben, sondern nur die Knoten, die die Eigenschaft **Faction = 1** haben, also zum Netzwerk von Mr. Hi gehören, behalten. Dazu verwenden wir den Befehl induce.subgraph() mit den gleichen Operatoren.

`> karate2 <- induced.subgraph(karate, V(karate)[Faction == "1"])`

`> plot(karate2)`

### Vergleich der beiden Netzwerke karate1 und karate2
`> dev.off() # schaltet vorhergehende Befehle aus`

`> par(mfrow=c(1,2)) # gibt vor, dass zwei Abbildungen in einer Zeile gezeigt werden sollen`

`> plot(karate1, layout = layout_with_kk, main = "delete vertices")`

`> plot(karate2, layout = layout_with_kk, main = "induced.subgraph")`

![Vergleich der Netzwerke](Link zum Bild)

Die Abbildung bestätigt, dass beides Mal das gleiche Netzwerk um Mr. Hi isoliert wurde. Zur besseren Vergleichbarkeit sind die beiden Netzwerke mit dem Kamada-Kawai Algorithmus visualisiert ("layout_with_kk"), der den Knoten einen festen Punkt zuweist und sich so gut für den Vergleich von Netzwerken und Teilnetzwerken eignet.

**Übung**: Vergleichen Sie jetzt die Untergruppen Faction 1 und Faction 2 in einem Netzwerk. Das Ergebnis sollte so aussehen... Am einfachsten funktioniert dies mit dem Befehl "delete_vertices". Sie können das Skript von oben entsprechend anpassen.

![Zwei Fraktionen](Link zum Bild)

### Teilnetzwerke nach Kantengewichten isolieren
Das gleiche lässt sich auch für die Kanten in einem Netzwerk machen. Beispielsweise wollen wir nur Kanten mit einem Gewicht > 4 in dem Netzwerk behalten. Dazu verwenden wir den Befehl [subgraph.edges](http://igraph.org/r/doc/subgraph.html) und entsprechende logische Operatoren.

`> karate4 <- subgraph.edges(karate, E(karate)[weight > 4]) # zeigt nur Kanten mit einem Gewicht größer 4 an`

`> karate4`

`> plot(karate4)`

Natürlich lassen sich die Variablen in allen Beispielen entsprechend anpassen, dazu lassen sich die **eingängigen logischen Operatoren** verwenden.

* = entspricht genau dem Wert
* > ist größer als bzw. < ist kleine als
* ! ist nicht (logischer Ausschluss, kann sich auf gleich bzw. größer oder kleiner beziehen und wird vorangestellt, z.B. != ist nicht gleich, !> ist nicht größer oder !< ist nicht kleiner)

Hier ist es wichtig, sich die Gruppe, die besonders interessant ist, logisch abzuleiten. Manchmal ist es z.B. einfacher, alle Attributswerte zu löschen, die **nicht** zutreffen, um eine bestimmte Gruppe zu isolieren.

### Auflösung Faction 1 und Faction 2
`> karate1 <- delete_vertices(karate, V(karate)[Faction != "1"])`

`> karate2 <- delete_vertices(karate, V(karate)[Faction == "1"])`

`> dev.off()`

`> par(mfrow=c(1,2))`

`> plot(karate1, layout = layout_with_kk, main = "Faction 1")`

`> plot(karate2, layout = layout_with_kk, main = "Faction 2")`
## Komponenten, Communities und Cluster
Komponenten und Cluster haben auf den ersten Blick einen oberflächlichen Zusammenhang, weil sie etwas über die Zusammensetzung des Netzwerks aussagen.

* Komponenten (components) sind die Bestandteile eines Netzwerks. Sind alle Knoten miteinander verbunden, gibt es nur eine Komponente. Zerfällt ein Netzwerk hingegen in unterschiedliche, unverbundene Unternetzwerke, dann werden diese als Komponenten eines Netzwerks bezeichnet.
* Cluster hingegen sind Ansammlung von Knoten innerhals eines Netzwerks, die aufgrund einer bestimmten Eigenschaft zusammen aggregiert sind.

Components können also Cluster enthalten, aber nicht umgekehrt.

### Einlesen eines Beispieldatensatzes
Schauen wir das an einem Beispiel an. Wir verwenden dafür das Beziehungsnetzwerk aus dem [Kurs](https://github.com/hdm-crpr/226305/tree/master/datasets/kurs). Wir nutzen die CSV Dateien ehelp und nodes. Die Links, mit denen wir mithilfe der unteren Befehle die Daten einlesen, generiert man, indem man auf die jeweilige Datei und dann auf "raw" drückt. Die angezeigte URL kann dann in den Befehl kopiert werden.

`> library(igraph) # nicht vergessen!`

`> # die Dateien werden direkt aus dem GitHubVerzeichnis gelesen`

`> help <- read.csv("https://raw.githubusercontent.com/hdm-crpr-226305/master/datasets/kurs/ehelp.csv", header=T, as.is=T, sep=",")`

`> nodes <- read.csv("https://raw.githubusercontent.com/hdm-crpr-226305/master/datasets/kurs/nodes.csv", header=T, as.is=T, sep=",")`

`> # prüft, ob alle Variablen eingelesen wurden`

`> head(helP)`

`> head(nodes)`

`> # wandelt die edgelist in eine Matrix um und baut das igraph Objekt in Verbindung mit der nodelist`

`> hties <- as.matrix(help)`

`> help <- graph_from_data_frame(d=hties, vertices=nodes, directed=T) # damit ist das vorherige help überschrieben`

`> help`

`> # addiert edges auf, wenn sie auf der gleichen Beziehung sind`

`> h <- simplify(held, edge.attr.comb=list(weight="sum"))`

`> # ruft das finale igraph Objekt auf`

`> h`

`> # einfache Visualisierung`

`> plot(h, edge.arrow.size=0.2, edge.curved=0.2, layout=layout_with_fr, edge.width=E(h)$weight, main="Beispielnetzwerk Semester")`

Ihre Abbildung wurde jetzt mit dem Fruchterman-Rheingold Algorithmus visualisiert. Beachten Sie, dass die Visualisierung bei diesem Algorithmus iterativ ist, d.h. die Abbildungen sehen sich ähnlich, aber jedes Mal unterschiedlich aus.

Man erkennt dabei auf den ersten Blick, dass das Netzwerk **in zwei miteinander nicht verbundene Komoponenten** zerfällt.

![Beispielnetzwerk Semester](Link zum Bild)

### Analyse vom Komponenten
Für die Analyse von Komponenten des Netzwerks verwenden wir den Befehl [components](http://igraph.org/r/doc/components.html).

`> # Analyse der Components`

`> # Zunächst prüfen wir, ob das Netzwerk überhaupt zusammenhängend ist`

`> is_connected(h)`

`> # Die Aussage des logischen Operators ist immer "true" oder "false". True bedeutet, dass es sich nur um eine Komponente handelt. False, dass es sich um unverbundene Netzwerke handelt.`

`> # Diese Prüfung ist besonders bei großen und unübersichtlichen Netzwerken hilfreich`

`> # Mit dem Befehl components können wir die Komponenten in Gruppen einteilen`

`> co <- components(h)`

`> # zeigt uns die Verteilung und die Größe der Komponenten an`

`> co`

`> # Dabei zeigt sich, dass das Netzwerk aus zwei Komponenten besteht`

`> groups(co)`

`> # Die Komponenten zeigen uns die natürliche Verteilung im Netzwerk an`

### Community Analyse
Communities sind in der Regel dichte Teilnetzwerke. Es gibt eine Reihe von Algorithmen, um Communities zu bilden. Ein wichtiges Maß für Communities ist die Modularität. Modularität beschreibt, wie weit Knoten voneinander im Netzwerk entfernt sind. Je höher der Modularitätswert, desto weiter sind die Knoten voneinander entfernt bzw. zerfallen in Teilgruppen. Der Befehl für Communities und Cluster ist ähnlich, im Beispiel verwenden wir den [Walktrap](http://igraph.org/r/doc/cluster_walktrap.html)-Algorithmus.

Cluster sind Gruppen von Knoten, die über ähnliche Eigenschaften verfügen. Es gibt unterschiedliche Möglichkeiten, um Cluster zu analysieren. Beim Walktrap-Algorithmus geht es darum, dichte verbundene Teilnetzwerke zu finden (Communities). Die Idee basiert auf der Annahme, dass kurze Pfaddistanzen überwiegend im gleichen Netzwerk stattfinden. Als Beispiel verwenden wir wieder das Karate Netzwerk. Die Modularität zeigt an, wie stark einzelne Knoten voneinander abweichen.

`> k <- make_graph("Zachary") # erstellt das Netzwerk`

`> wc <- cluster_walktrap(k) # wendet die Cklusterung auf das Netzwerk an`

`> modularity(wc) # berechnet den Modularitätswert`

`> membership(wc) # weist die Mitgliedschaft in die Communities zu`

`> plot(wc, k) # visualisiert die Communities`

**Übung**: Analysieren Sie die Modularität und den Walktrap-Algorithmus des Semesternetzwerks:

`> wch <- cluster_walktrap(h)`

`> modularity(wch)`

`> membership(wch)`

`> plot(wch, h, edge.arrow.size=0.1, main="Communities im Semester")

Im Beispiel sieht man sehr schön, wie sich die Communities im Hilfesuch-Netzwerk unterteilen (Waktrap-Algorithmus).

![Walktrap Algorithmus](Link zum Bild)

Vertiefende Anmerung: Es gibt noch eine Reihe anderer Berechnungen für Communities und Cluster, aber für den ersten Überblick hat sich der Walktrap-Algorithmus bewährt.

## Dyaden und Triaden
Dyaden und Triaden sind wichtige Beschreibungen des Aufbaus eines Netzwerks.

### Anzahl der Dyaden
`> z <- make_graph("Zachary")`

`> dyad_census(z)`

**Mutual**: Die Ausgabe berechnet die Anzahl der dyadischen Beziehungen in einem Netzwerk. Da das Karate Netzwerk ungerichtet ist, entspricht die Anzahl der gegenseitigen Beziehungen (mutual) genau der Anzahl der Edges im Netzwerk (lässt sich aus dem igraph-Objekt z auslesen).

**Asymmetrische** Beziehungen sind nur in einem gerichteten Netzwerk relevant.

**Null** Beziehungen gibt an, wie viele Beziehungen nicht realisiert wurden. Auch wenn die Zahl auf den ersten Blick hoch erscheint, ist dies nicht weiter verwunderlich, weil das Netzwerk über eine geringe Dichte verfügt.

`> edge_density(z, loops=FALSE)`

### Triadenzensus
Triaden sind die zentralen Bausteine von Netzwerken. Sie können 16 verschiedene Formen annehmen, die überlicherweise immer in der gleichen Reihenfolge benannt sind:

`> triad_census(z) # führt den Triadenzensus durch`

Ausgegeben werden genau die 16 Typen in der Reihenfolge. Beispielsweise gibt es 45 vollständige Cliquen im Netzwerk.

`> # Durchsuchen nach Cliquen`

`> clique_num(z) # durchsucht nach maiximaler Anzahl von Cliquen`

**Übung**: Untersuchen Sie das Semesternetzwerk auf Cliquen.
