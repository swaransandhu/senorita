# Netzwerke analysieren
In Lektion 5 lernen Sie, wie man Netzwerke für die Analyse vorbereitet.
## Einführung Zachary Datensatz
Wir arbeiten zunächst mit dem Zachary Datensatz: karate, der bereits im igraphdata Paket hinterlegt ist. Er muss also nicht eingelesen werden, sondern kann direkt aufgerufen werden.

`> library(igraph) # lädt das igraph Paket´

`> library(igraphdata) # lädt die Datensätze aus dem igraphdata Paket´

`> data(karate) # lädt den Datensatz karate´

`> karate # zeigt das igraph Objekt karate an´

`> ?karate # liefert Hintergrundinformationen zum Datensatz´

`> plot(karate) # liefert eine erste Visualisierung´

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

**Übung**: Vergleichen Sie jetzt die Untergruppen Faction 1 und Faction 2 in einem Netzwerk. Das Ergebnis sollte so aussehen... Am einfachsten 
## Komponenten, Communities und Cluster
## Dyaden und Triaden
