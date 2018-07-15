# Netzwerk- und Akteursmaße berechnen
Generell wird zwischen zwei Arten von Maßen unterschieden, den Netzwerk- und den Akteursmaßen. Bei einer effizienten Projektdurchführung sollten nicht sämtliche Maße berechnet werden, sondern nur diejenigen, die einen Stellenwert hinsichtlich der Forschungsfrage besitzen. Je nachdem, welche Strukturen man untersucht, sollte man die Aussagekraft und Interpretation der Maße hinterfragen.

## Netzwerkmaße
Netzwerkmaße beziehen sich auf das gesamte Netzwerk. Die Maßangaben eignen sich damit besonders, um mehrere Netzwerke miteinander zu vergleichen und Aussagen über die Gemeinsamkeiten und Unterschiede zu treffen. Netzwerkmaße geben ebenfalls Auskunft über die Beschaffenheit eines Netzwerks. Typische Maße sind die Dichte, Cliquen, Pfaddistanz und der Durchmesser, die in den folgenden Unterkapiteln näher beleuchtet werden.

### Dichte
In einem ungerichteten Netzwerk mit x Knoten können rein mathematisch maximal (x(x-1))/2 Kanten verlaufen. Zwischen fünf Personen können also beispielsweise maximal ((5(5-1)/2)=10 Kanten beobachtet werden. Die Dichte eines Netzwerks sagt aus, wie vieler dieser maximal möglichen Beziehungen realisiert sind – man berechnet also den Quotienten der tatsächlichen und maximalen Kanten. Wenn zwischen den fünf Knoten wirklich 10 Kanten verlaufen, ist die Dichte=10/10=1, also 100%. 

Um die Dichte eines Netzwerks „network“ zu berechnen, gibt man den folgenden Befehl in *R* ein:

`> edge_density(network)`

Dabei sollte man aufpassen, dass das Netzwerk, das man als Objekt in der Klammer benennt, weder mehrfache Beziehungen zwischen den Knoten hat, noch zulässt, dass ein Knoten eine Beziehung zu sich selbst führen kann. Dies könnte dazu führen, dass Werte über 100% angezeigt werden und die Dichte damit verfälscht wäre. Falls das untersuchte Netzwerk jedoch mehrfache und selbstreferenzielle Beziehungen mit einschließt, kann man zur Untersuchung der Dichte einfach eine simplifizierte Version des Basisnetzwerks anfertigen:

`> simplenetwork <- simplify(network, remove.multiple = TRUE, remove.loops = TRUE)`

`> edge_density(simplenetwork)`

Es gibt die Möglichkeit, remove.multiple auf FALSE zu lassen, also nur die selbstreferenziellen Beziehungen durch das Argument remove.loops=TRUE auszublenden. Das kann je nach Forschungsfrage und beobachteter Beziehung bei gerichteten Netzwerken Sinn machen, etwa, wenn man den Austausch von Geld betrachtet. Hier können zwischen jedem Knoten zwei Beziehungen liegen, also gibt es maximal x(x-1) mögliche Kanten. *R* nimmt als 100%-Wert jedoch immer die maximal möglichen Kanten eines ungerichteten Netzwerks als Referenz. Die Dichte, die man bei einem gerichteten Netzwerk mit der Möglichkeit zweier Kanten zwischen Knoten anzeigen lassen kann, muss demnach auf 200% referenziert werden.

### Cliquen
Der Begriff „Clique“ ist doppelt besetzt – zum einen bezeichnet er die perfekte Triaden-Form, zum anderen lässt er sich mit folgender Definition eingrenzen:

Cliques are one of the simplest types of cohesive subgroups, and because of their straightforward definition are also one of the easiest types to understand. A clique is a maximally complete subgraph; that is, it is a subset of nodes that have all possible ties among them

(Luke 2015, S. 107)

Demnach beschreibt der Begriff „Clique“ schlicht den Umstand, wenn zwischen Knoten die Dichte = 1 ist, also alle möglichen Kanten realisiert worden sind. Wir werden uns im Folgenden beide Fälle näher anschauen.

#### Die Clique als Triade „300“
Eine Triade ist eine Netzwerkform, in der es drei Knoten gibt. Wenn zwischen diesen Knoten gerichtete Kanten bestehen, gibt es sechzehn mögliche Triaden-Konstellationen, die auftreten können. Jede hat einen eindeutigen Namen, jeweils symbolisiert durch einen dreistelligen Code und einem Buchstaben, falls der Code gleich ist, jedoch zwei unterschiedliche Konstellationen beschrieben werden. Die erste Ziffer des Codes beschreibt die Anzahl der reziproken, die zweite die der gerichteten und die dritte die der nicht-bestehenden Kanten innerhalb einer Triade (Fuhse, 2016, S. 70). Die Triade, in der keine Kante realisiert ist – in der zwischen den drei Knoten also keine Beziehung herrscht – hat die Codierung „003“. Die Clique, welche die perfekte Triade mit drei realisierten, reziproken Beziehungen beschreibt, hat die Codierung „300“.

Mit *R* kann man den Triadenzensus durchführen, das bedeutet, dass man sich anzeigen lassen kann, welche Triaden-Konstellationen wie oft im Netzwerk auftreten. Der Befehl dafür heißt:

`> triad_census(network)`

Ausgegeben werden sechzehn Lösungen, deren Reihenfolge im Paket *igraph* nachvollzogen werden kann. Wenn man im Reiter packages auf das Paket igraph klickt und den Befehl triad_census auswählt, werden die Triaden-Konstellationen angezeigt.

#### Die Clique als Sub-Netzwerk mit einer Dichte von 1
Wenn man sich Cliquen mit einer bestimmten Anzahl von Knoten anzeigen lassen möchte, so verwendet man den folgenden Befehl:

`> cliques(network, min="1", max="4") # Zeigt alle Cliquen an, die mindestens einen und maximal vier Knoten beinhalten.`

Die Anzahl der Knoten lässt sich dabei durch die Argumente min und max definieren. Ausgegeben werden sämtliche Cliquen und die dazugehörigen Knoten.
Man kann ebenfalls nach den größten und den maximalen Cliquen suchen. Größte Cliquen sind diejenigen, welche die meisten Knoten beinhalten. Anzeigen lassen kann man sie sich mit dem Befehl:

`> largest_cliques(network)`

Maximale Cliquen sind Cliquen, die nicht mehr zu einer größeren Clique erweitert werden können. Größte Cliquen sind also immer maximale Cliquen, andersherum kann man diese Aussagen jedoch nicht treffen, da maximale Cliquen nicht von der Anzahl der Knoten abhängen, sondern davon, ob ein neuer Knoten in die bestehende Clique integriert werden kann. Stellen Sie sich beispielsweise vor, sie sind mit drei Leuten gut befreundet und auch diese Personen kennen sich untereinander. Sie bilden damit eine Clique, da jeder jeden kennt und die Dichte 1 beträgt. Stellen Sie sich weiterhin vor, dass sie und einer ihrer Freunde eine weitere Person kennen, diese aber nicht mit ihren anderen zwei Freunden aus ihrer Clique bekannt ist. Sie könnten nicht sagen, dass mit der Aufnahme dieser neuen Person die Clique um einen Knoten vollwertig vergrößert werden könnte, da die Dichte nicht mehr gleich 1 wäre, da diese Person zu ihren anderen zwei Freunden keine Beziehung pflegt. Wenn es sich nun so verhält, dass keine Person auf der Welt in ihre Clique mit dem Erhalt der Dichte gleich 1 integriert werden könnte, dann ist ihre Clique maximal, da sie nicht erweitert werden kann. Sie muss jedoch nicht zwingen die größte Clique sein, da sie vielleicht noch ein anderes Freundschaftsnetzwerk mit zwölf anderen Kollegen haben. Maximale Cliquen kann man sich mit diesem Befehl anzeigen lassen:

`> max_cliques(network)`

### Pfaddistanz
Die „**Pfaddistanz** zwischen zwei Akteuren besteht aus der Anzahl der (gerichteten) Verbindungen, über die ein Akteur im Netzwerk den zweiten Akteur erreichen kann“ (Fuhse, 2016, S. 61, Herv. i. Org.). Dabei gilt immer der kürzeste Weg zwischen den beiden Knoten und nicht etwa der maximal mögliche. Möchte man sich die Distanzen zwischen zwei Knoten anzeigen lassen, so nutzt man den folgenden Befehl:

`> distances(network, v = V(network), to = V(network))`

In der Konsole wird eine Matrix angezeigt, bei der man die Pfaddistanz zwischen den Knoten ablesen kann. Um sich schneller anzeigen lassen zu können, welche Knoten am weitesten voneinander entfernt sind, gibt man ein:

`> farthest_vertices(network)`

Möchte man die mittlere Pfaddistanz berechnen, also die Anzahl der Pfade, die man im Durchschnitt braucht, um von Knoten A zu B zu gelangen, nutzt man den Befehl:

`> mean_distance(network)`

Diese Befehle gelten allgemein für alle Netzwerke, wobei die Berechnung der Pfaddistanz logischer und einfacher zu handhaben ist, wenn man ein ungerichtetes Netzwerk analysiert. Hier können Kanten einfach „abgelaufen“ werden, während man bei gerichteten Netzwerken eigentlich noch beachten müsste, in welche Richtungen die Kanten zeigen. Dies kann man jedoch ebenfalls in die Befehle integrieren:

`> mean_distance(network, directed = FALSE) # Nutzt man diesen Befehl bei gerichteten Netzwerken, werden die Kanten wie ungerichtete Kanten behandelt.`

`> mean_distance(network, directed = TRUE) # Nutzt man diesen Befehl bei gerichteten Netzwerken, werden die Kanten wie gerichtete Kanten behandelt.`

Welche Art und Weise der Berechnung Sinn macht, ist wie immer abhängig von der Forschungsfrage und den abhängigen Variablen, die man untersuchen will. 

### Durchmesser
Der Durchmesser ist die Pfaddistanz der Knoten, die man mithilfe des Befehls farthest_vertices ermittelt hat, also die Pfaddistanz der am weitesten voneinander entfernten Knoten. Man kann den Durchmesser mit dem folgenden Befehl errechnen lassen:

`> get_diameter(network)`

## Akteursmaße
Akteursmaße beziehen sich auf einzelne Akteure und deren Position im Netzwerk. Die Maße geben meist Auskunft darüber, welchen Stellenwert ein Knoten im Netzwerk einnimmt und wie stark er vernetzt ist. Im Mittelpunkt der Betrachtung steht immer die Frage, ob ein Knoten eine zentrale oder periphere Rolle im Netzwerk spielt. Bei den Akteursmaßen geht es dementsprechend um die Zentralität.

### Zentralität
»It makes intuitive sense that a network member who is connected to many other members of the network is in a prominent position. For non-directed networks, we will say that this type of actor has high centrality, or that it is in a central position. However, there are a number of ways of operationalizing this type of prominence. In fact, there are dozens of centrality statistics available to the network analyst.«

(Luke 2015, S. 91)

Die Zentralität eines Akteurs kann demnach nicht nur unterschiedlich definiert, sondern auch auf verschiedene Weisen berechnet werden. Dabei geht man jedoch stets von der Idee aus, dass manche Knoten eine wichtigere Position innerhalb des Netzwerks einnehmen als andere. Diese werden auch als periphere Knoten bezeichnet.

Welchen Wert man zur Berechnung der Zentralität heranziehen möchte, leitet sich vor allem aus der Forschungsfrage, den inhaltlichen Gegebenheiten des Netzwerks und der Definition der Beziehungen ab. Im Nachstehenden sehen Sie eine kurze Übersicht über die Zentralitätsmaße und deren Befehle für die Pakete *statnet* und *igraph* (Luke 2015, S. 95), wobei wir im Seminar vorrangig mit *igraph* arbeiten.

![Befehle für Akteursmaße](/00_images_Akteurbefehl.png)

In den folgenden Unterkapiteln werden wir mehrere Zentralitätsmaße anschauen, darunter das Degree, die Betweenness, Closeness, den Eigenvektor und den K-Core.

### Degree
Bei der Degree-Zentralität werden „die Verbindungen eines Knoten gezählt – Akteure mit vielen Sozialbeziehungen sind wichtiger im Netzwerk als solche mit wenigen“ (Fuhse, 2016, S. 59). Dabei unterscheidet man „zwischen der Anzahl der empfangenen Beziehungen (**Indegree**) und der der von einem Akteur an andere geschickten Beziehungen (**Outdegree**)“ (ebd., Herv. i. Org.).

Wenn Sie sich die Degrees für die Knoten eines Netzwerks ausgeben möchten, so wenden Sie den Befehl degree() auf Ihr Netzwerk an.

`> degree(network)`

Sie erhalten eine Liste der Knoten und die Anzahl ihrer Beziehungen. Sie können auch nur die In- oder Outdegrees anzeigen lassen, was nur bei einem gerichteten Netzwerk sinnvoll ist.

`> degree(network, mode="in") # Zeigt nur die Anzahl der Indegrees an`

`> degree(network, mode="out") # Zeigt nur die Anzahl der Outdegrees an`

Die absoluten Zahlen sagen uns aber noch nicht viel. Deshalb können die Degrees normalisiert werden. Dabei werden sie durch alle möglichen Degrees des Graphs geteilt. Gerade bei großen Netzwerken ist eine Normalisierung/Indexierung wichtig, damit die Degrees vergleichbar werden.

`> degree(network, normalized = TRUE)`

Auch bei der Spezifizierung auf In- und Outdegrees können die Werte normalisiert werden:

`> degree(network, mode="in", normalized=TRUE)`

`> degree(network, mode="out", normalized=TRUE)`

Das Degree-Maß kann dafür verwendet werden, die Größe der Knoten anzupassen. Knoten, die zentraler sind als andere, werden dementsprechend größer dargestellt. Dieses Attribut findet sich im Argument des Plot-Befehls wieder.

`> plot(network, vertex.size.degree(network)^2) # Visualisiert den Datensatz network basierend auf der Größe der Degrees von network. Das Ergebnis wird mit 2 potenziert, damit der Graph einfacher zu lesen ist. Alternativ kann die Größe auch über eine Skalierungsfunktion ausgegeben werden. Ideal für die Darstellung sind Werte zwischen 5 und 15.`

### Betweenness
„Die Betweenness-Zentralität eines Knotens steht für die Anzahl der kürzesten Pfade im Netzwerk, die über diesen Knoten laufen“ (Fuhse, 2016, S. 63). Das bedeutet umgangssprachlich, dass ein Knoten, über den man zwangsweise laufen muss, um seine Ziele zu erreichen, einen höheren Betweenness-Wert hat als andere. Stellen Sie sich beispielsweise ein Ego-Netzwerk vor, bei dem mehrere Knoten an das Ego geknüpft, diese jedoch untereinander nicht verbunden sind. Wollen Sie auf kürzestem Weg von einem Knoten zu einem anderen, **müssen** Sie über das Ego laufen. Die Berechnung der Betweenness-Zentralität ist damit – wie fast jedes Zentralitätsmaß – bei einem Ego-Netzwerk unsinnig, da das Ego allein durch die Struktur des Netzwerks die höchste Zentralität hat.

Die Betweenness-Zentralität berechnet man für alle Knoten des Netzwerks mit:

`> betweenness(network)`

### Closeness
„Die **Closeness-Zentralität** misst die Anzahl der kürzesten Pfade (Beziehungen) von einem Akteur zu allen anderen Akteuren. Je größer die Closeness-Zentralität eines Akteurs ist, umso schneller kann er sämtliche direkten und indirekten Kontakte erreichen“ (Sakschewski, o.J., Abschnitt 6, Herv. i. Org.). Die Closeness berechnen sie mithilfe des folgenden Befehls für alle Knoten des Netzwerks:

`> closeness(network)`

### Eigenvektor
„Mit dem Zentralitätsmaß "Eigenvektor" wird ermittelt, wie gut eine Entität verbunden ist und wie stark der direkte Einfluss ist, den sie auf andere Entitäten im Netzwerk ausüben kann“ (IBM Corporation, 2017, Abschnitt 7). Knoten mit einem hohen Eigenvektor-Maß sind mit wichtigen Knoten verbunden.

Das Eigenvektor-Maß wird wie folgt für alle Knoten berechnet:

`> eigen_centrality(network)`

### K-Core
„Coreness ist ein Maß, das bei der Identifizierung von eng miteinander verbundenen Gruppen innerhalb eines Netzwerks hilfreich ist. Der K-Core bezeichnet die größte der Gruppen, deren Entitäten mit mindestens k anderen Entitäten innerhalb der Gruppe verbunden sind“ (IBM Corporation, 2017, Abschnitt 10).

Der K-Core kann mithilfe dieses Befehls berechnet werden:

`> coreness(network)`

## Beispiel Semesternetzwerk

Wenden Sie Ihr neu erlerntes Wissen gleich an und berechnen Sie die verschiedenen Netzwerk- und Akteursmaße innerhalb des Semesternetzwerks! Laden Sie dazu dieses Skript herunter, speichern Sie es in Ihrem Working Directory ab und öffnen es in *RStudio*. Im Video wird Ihnen Schritt für Schritt erklärt, welche Maße erhoben werden und welche Aussagekraft diese besitzen.

## Quellen
Fuhse, J. A. (2016). *Soziale Netzwerke: Konzepte und Forschungsmethoden*. Konstanz u. München: UVK Verlagsgesellschaft.

IBM Corporation. (2017). Zentralität und Zentralitätsmaße. Abgerufen von https://www.ibm.com/support/knowledgecenter/de/SSXVXZ_2.1.8/com.ibm.i2.anb.doc/sna_centrality.html

Luke, D. A. (2015). *A User's Guide to Network Analysis in R*. Wiesbaden: Springer VS.

Sakschewski, T. (o.J.). *Zentralität und Prestige*. Abgerufen von http://www.wissensstrukturplan.de/wissensstrukturplan/glossar/z_zentralitaet.php
