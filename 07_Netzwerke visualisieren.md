# Netzwerke visualisieren
Visualisierungen bieten einen Überblick über verschiedene Netzwerke. Dabei können unterschiedliche Arten von Visualisierungen gemacht werden. Um sich Netzwerke in *RStudio* anzeigen zu lassen, gibt es e vordefinierte Befehle.

## Einfache Visualisierung
Um Ihr Netzwerk zu visualisieren, müssen Sie den plot-Befehl aus dem *igraph*-Paket nutzen. Dafür muss ihr Netzwerk als *igraph*-Objekt vorliegen. Wie Sie Ihre Edge- und Nodelist einlesen und das Netzwerk zum *igraph*-Objekt umwandeln, haben Sie bereits gelernt.

Der plot-Befehl ist einfach aufgebaut. Grundlegend reicht es, den Befehl basal auszuführen:

`> plot(network)`

Sie sehen jetzt das Netzwerk unter dem Reiter „Plots“. Mit der Zoom-Funktion können Sie sich Ihr Netzwerk genauer anschauen. In den seltensten Fällen werden Sie jedoch mit dem Ergebnis zufrieden sein – zu Ihrem Glück kann der plot-Befehl mithilfe mehrerer Argumente angepasst und auf Ihr Netzwerk individualisiert werden. In den folgenden Kapiteln lernen Sie, wie das funktioniert und welche Tricks es gibt, damit Ihr Netzwerk richtig visualisiert wird.

### Erweiterung der Basis-Visualisierung
In ein paar einfachen Schritten kann man aus der basalen plot-Darstellung ein ansehnliches Netzwerk erstellen. Wenn wir bei einem gerichteten Netzwerk die Pfeilgrößen der Kanten anpassen wollen, schreiben wir:

`> plot(network, edge.arrow.size=0.4) # Natürlich kann die Zahl je nach Belieben angepasst werden.`

Wenn Sie anstatt der Labels die Namen der Knoten bei der Visualisierung anzeigen lassen wollen (vorausgesetzt es gibt in der Nodelist das Attribut „name“), dann können Sie den folgenden Befehl nutzen:

`> plot(network, vertex.label=V(network)$name) # Haben Sie das Attribut anders genannt, müssen Sie natürlich Ihre Attributs-Benennung angeben.`

Wenn Sie die Labels ganz ausschalten möchten, setzen sie vertex.label gleich NA.

`> plot(network, vertex.label=NA)`

Natürlich kann man sämtliche Bausteine des Netzwerks anders färben. Dazu lassen wir uns erst einmal alle Farben anzeigen, die *R* zur Verfügung stellt. Natürlich können die Farben auch als Hexadezimalzahl angegeben werden.

`> colours() # Zeigt alle verfügbaren Farben an.`

`> plot(network, vertex.color="pink2") # Färbt die Knoten mit der Farbe pink2.`

Auch der Knotenrahmen kann gefärbt oder gar ausgeblendet werden.

`> plot(network, vertex.frame.color="red3") # Färbt den Knotenrahmen in red3.`

`> plot(network, vertex.frame.color="transparent") # Macht den Knotenrahmen transparent.`

Auch die Kanten können eingefärbt werden.

`> plot(network, edge.color="yellow") # Färbt die Kanten in yellow`

Sie können veranlassen, dass die Labels in serifenloser Schrift angezeigt und ebenfalls gefärbt werden.

`> plot(network, vertex.label.family = "Helvetica")`

`> plot(network, vertex.label.color = "magenta3") # Färbt die Labels in magenta3.`

Man kann ebenfalls die Labels etwas weiter weg von den Knoten darstellen. Dabei erhöht man die Vertex-Label-Distanz.

`> plot(network, vertex.label.dist=2)`

Sie können Ihrem Netzwerk eine Überschrift geben.

`> plot(network, main="Das ist der Titel") # Achten Sie auf Umlaute.`

Wenn Sie Ihre Beziehungen in der Edgelist auf irgendeine Art und Weise gewichtet haben, können Sie die Kantenstärke abhängig von der Gewichtung visualisieren.

`> plot(network, edge.width=E(tutgraph)$weight)`

Sie sehen – es ist vieles möglich mit dem plot-Befehl. Man kann ihn anpassen, erweitern und individuell auf sein Netzwerk abstimmen.

## Layouts für das Netzwerk von igraph
The igraph package provides the user with a similar set of options for controlling the layouts of network graphics. The layout option is used to specify an existing layout function or refer to a set of vertex coordinates. See ?igraph.plotting for more information on plotting and layout options in igraph (Fig. 4.7).

(Luke, 2015, S. 52)

Das Layout eines Netzwerks bestimmt dessen Darstellung im Reiter Plots. Das Layout kann im plot-Befehl definiert werden:

`> plot(network, layout = layoutname)`

Mehrere Layouts können in „layoutname“ eingesetzt werden. Hinter diesen steckt jeweils ein Algorithmus, der dafür sorgt, dass die Knoten und Kanten auf unterschiedliche Weise angeordnet werden. Nachfolgend finden Sie eine Aufstellung der wichtigsten Layouts:

* layout_nicely: Dies ist die Default Einstellung. Für Ihr Netzwerk wird automatisch ein passendes Layout gewählt.
* layout_with_kk: Dieses Layout folgt dem Kamada-Kawai-Algorithmus. Es bietet sich an, um mehrere Graphen miteinander zu vergleichen, da es Netzwerke immer auf ein und dieselbe Art und Weise anordnet.
* layout_with_fr: Der Fruchterman-Rheingold-Algorithmus verteilt die Knoten basierend auf physikalischen Anziehungen.
* layout_in_circle: Ordnet die Knoten als Kreis an. Die Reihenfolge der Knoten folgt der ID.
* layout_randomly: Die Knoten werden vollkommen zufällig angeordnet.

![Layouts](/00_images/layout.png)

(Luke 2015, S. 52)

Drei der Designs werden im Folgenden dargestellt.

![Layouts](/00_images/layoutvergleich.png)

(Luke, 2015, S. 52)

Die Entscheidung für das richtige Layout ist nicht trivial, immerhin beeinflusst uns besonders die Darstellung der Knoten in unseren Aussagen, wie die einzelnen Akteure zueinander stehen. Das Layout „layout_in_circle“ vermittelt beispielsweise augenscheinliche Gruppenkonstellationen, die es so aber tatsächlich nicht gibt, und versagt darin, echte Cliquen und Gruppen sinnvoll darzustellen.

### Wenn das Layout nicht gut aussieht
Wie Sie sehen, gibt es viele Algorithmen, die Ihnen dabei helfen können, Ihr Netzwerk bestmöglich zu layouten. Nichtsdestotrotz gibt es noch zwei Tipps, falls das Layout mal nicht so gut aussieht – trotz helfender Algorithmen.

#### Das Netzwerk mit dem plot-Befehl entzerren
Wenn Sie besonders viele Knoten haben, kann es helfen, das Netzwerk zu entzerren. Dafür können Sie zunächst eine Matrix erstellen, die das Layout um einen Faktor multipliziert. Diesen Faktor müssen Sie durch Ausprobieren herausfinden, der Großteil der Knoten sollte sich noch im plot-Fenster befinden.

`> coords <- layout_with_kk(network)*0.4 # Sie sollten den Kamada-Kawai-Algorithmus verwenden, damit ihr Netzwerk in den nächsten Schritten immer auf dieselbe Art und Weise dargestellt wird. Den Namen „coords“ können Sie natürlich frei wählen.`

Jetzt können Sie im plot-Befehl nicht nur das Layout gleich coords setzen, sondern auch die Grenzen des Graphs individuell setzen. Um die richtigen Zahlen dafür zu finden, ist auch hier Ausprobieren angesagt. ylim bezeichnet jeweils die untere (erste Zahl) und obere (zweite Zahl) Bildgrenze, xlim die linke (erste Zahl) und rechte (zweite Zahl).

`> plot(network, layout=coords, rescale=FALSE, ylim=c(-1.0,1.0),xlim=c(-1.0,1.0), asp = 0)`

#### Das Paket visNetwork nutzen
Es gibt ein Paket, mit dem man Netzwerke viel schöner darstellen lassen kann als mit dem plot-Befehl. Es eignet sich damit gut, um Visualisierungen für Präsentationen oder ähnliches anzufertigen. Ein großer Nachteil gegenüber dem plot-Befehl liegt jedoch darin, dass ein *visNetwork*-Netzwerk nicht als PDF exportiert werden kann. Dementsprechend müssen Sie das Netzwerk im Zoom-Fenster screenshotten. Die Qualität bleibt dabei jedoch gut, weshalb sich ein Blick auf *visNetwork* auf jeden Fall lohnt. Zunächst sollten Sie das Paket installieren und laden.

`> install.packages("visNetwork", dependencies=TRUE)`

`> library(visNetwork)`

Sie werden für die Visualisierung den Befehl visIgraph nutzen. Wie der Name vermuten lässt, benötigen Sie auch hier ein *igraph*-Objekt. Das haben Sie jedoch, wenn Sie *igraph* und den plot-Befehl nutzen, eh im Vorhinein. Vorab können Sie das Aussehen der Knoten und Kanten definieren. Achten Sie darauf, dass *visNetwork* nicht die Farben kennt, die Ihnen *R* mit colours() zur Verfügung stellt. Geben Sie daher lieber Hexadezimalzahlen  an.

`> E(network)$arrow.size <- 0.1 # Die Pfeilspitzengröße bei gerichteten Netzwerken.`

`> E(network)$color <- "lightgrey" # Die Farbe der Kanten.`

`> V(network)$color <- "pink" # Die Farbe der Knoten.`

`> V(network)$size <- 10 # Die Größe der Knoten.`

`> V(network)$frame.color <- "transparent" # Der Rahmen der Knoten.`

`> V(network)$label.color <- "black" # Die Farbe der Labels.`

Danach plotten Sie das Netzwerk mit dem Befehl visIgraph. All ihre vorab festgelegten Einstellungen werden erkannt und übernommen. Das Argument type ist in der Default-Version auf nicely gesetzt. Mit full sorgen Sie dafür, dass das Netzwerk das gesamte Fenster einnimmt.

`> visIgraph(UKfaculty, type = "full")`

Praktischerweise kann man im Zoom-Fenster die Knoten mit der Maus je nach Lust und Laune verschieben und damit sehr dichte, unübersichtliche Stellen entzerren. Haben die Entfernungen der Knoten jedoch einen wichtigen Sinn, sollte man dies natürlich vermeiden.

## Visualisierung von Netzwerk- und Akteursmaßen
Prinzipiell sollten Sie sich vor der Visualisierung eines Netzwerks überlegen, welche Relationen und Maße sie darstellen wollen. Schließlich soll das Netzwerk eine Antwort auf Ihre Forschungsfrage liefern. Am besten ist es immer, wenn Sie sich zunächst eine Skizze anfertigen.

Im Allgemeinen können wir die Attribute von Knoten und Kanten visualisieren. Denken Sie auch daran, dass es sinnvoll sein kann, ein Netzwerk nach bestimmten Kriterien zu unterteilen, um es vergleichbar zu machen.

Für das **Netzwerk** stehen uns die typischen Netzwerkmaße zur Verfügung:

* Dichte (density)/Kohäsion
* Pfaddistanz (path distance)
* Cluster/Untergruppen

Für die **Knoten** stehen uns folgende Parameter zur Verfügung:

* Größe (vertex.size), z.B. nach Zentralitätsmaßen wie Degree
* Farbigkeit, z.B. mit unterschiedlichen Farben für das Geschlecht oder der Zugehörigkeit zu einer Untergruppe im Netzwerk. Hierzu wird ein Vektor definiert, der für bestimmte Eigenschaften greift.
* Form, etwa ein Kreis oder Dreieck für bestimmte Attribute wie Geschlecht, aber auch Branche oder ähnliches.

Für die **Kanten** können die verschiedenen Attribute der Kanten visualisiert werden (edge.attributes), etwa

* Art der Beziehung (Farbe)
* Stärke der Beziehung (Dicke der Kante)

Das sind die einfachsten Visualisierungsparameter. Wenn das Netzwerk und die Beantwortung der Forschungsfrage steht, kann die Visualisierung entsprechend verfeinert werden.

Richtig interessant werden die Netzwerke immer dann, wenn wir bestimmte Attribute in Relation setzen können. Beispielsweise wollen wir den Degree-Wert der einzelnen Knoten durch die Größe der Knoten darstellen. Sie erinnern sich: der Degree ist ein einfaches Zentralitätsmaß, das angibt, wie viele Verbindungen ein Knoten zu anderen Knoten hat.

`> plot(karate, vertex.size=degree(karate), vertex.label=NA)`

Der Befehl visualisiert jetzt das Netzwerk ohne labels, aber mit den einfachen Häufigkeiten der ungerichteten Beziehungen, die ein Knoten haben kann. Das haben wir schon früher gesehen.

(Zur Vertiefung sehr zu empfehlen: Ognyanova, K. (2017). *Network visualization with R.* Retrieved from www.kateto.net/network-visualization)

## Beispiel: Visualisierung Zachary's Karateclub
Rufen wir uns zunächst Zachary's Netzwerk nochmals in Erinnerung:

`> library(igraphdata)`

`> data(karate)`

`> plot(karate)`

Wir sehen im Reiter plots, dass das Netzwerk bereits nach dem Vertex Attribut „Faction“ farbig codiert ist. Überprüfen kann man dies, indem man sich die Ausprägungen der Attribute „color“ und „Faction“ anzeigen lässt.

`> vertex_attr(karate, "color")`

`> vertex_attr(karate, "Faction")`

Wir sehen, dass die beiden Attribute identisch sind. „color“ wird für die Visualisierung automatisch ausgelesen. Wir löschen jetzt das Attribut „color“ aus dem Datensatz und schreiben das Ergebnis in ein neues Netzwerk karate_new

`> karate_new <- delete_vertex_attr(karate, "color")`

Wir wollen jetzt den Datensatz neu einfärben. Faction 1 (um John A) soll die Farbe grün erhalten und Faction 2 (um Mr Hi) die Farbe rot.

`> farbe <- c("red", "green") # Wir legen jetzt eine Farbskala an, die genau zwei Farben umfasst`

`> V(karate_new)$color <- farbe[V(karate_new)$Faction] # Diese Farbskala wenden wir auf die Funktion color an und zwar für die Spalte Faction`

`> plot(karate_new)`

Wir können jetzt einfach die Farben im Vektor „farbe“ austauschen, probieren Sie das einfach mal aus:

`> farbe <- c("gold", "lightgreen")`

`> V(karate_new)$color <- farbe[V(karate_new)$Faction]`

`> plot(karate_new)`

Wir haben bereits gelernt, wie wir die Größe der Knoten in Relation zu den Degrees setzen können:

`> farbe <- c("gold", "lightgreen")`

`> V(karate_new)$color <- farbe[V(karate_new)$Faction]`

`> plot(karate_new, vertex.size=degree(karate), vertex.label=NA)`

Achtung: es gibt den Befehl degree() mehrmals in *R*. Achten Sie darauf, dass Sie den Befehl aus dem *igraph*-Paket verwenden. Wenn das Paket *SNA* noch geladen ist, kommt das zu Konflikten. Sie können das *SNA*-Paket wieder aus dem Programmspeicher löschen: detach("package:sna", unload=TRUE)

`> deg <- degree(karate, mode="all") # Berechnet das Degree-Maß von allen Knoten`

`> V(karate)$size <- deg # Weist dem Vektor Size die Berechnung des Degree-Maßes zu`

`> plot(karate, vertex.size=deg)`

Als weitere Darstellung können wir die Stärke der Kanten visualisieren. Dazu benötigen wir einen Vektor, der die Kantenstärke erfasst. Prüfen wir vorher noch schnell, wie sich das Kantenattribut weight verhält:

`> edge.attributes(karate_new)$weight`

Die Kantenstärke von 78 Kanten reicht von 1 bis maximal 7. Damit diese etwas übersichtlicher dargestellt werden, halbieren wir diesen Wert

`> E(karate_new)$width <- E(karate_new)$weight/2

`> plot(karate_new)

Das Skript finden Sie [hier](/skripte/KarateVisualisierung.R) praktisch zum Download.

## Quellen

Luke, D. A. (2015). *A User's Guide to Network Analysis in R*. Wiesbaden: Springer VS.
