# Netzwerkdaten laden bzw. importieren
In Lektion 4 lernen Sie, bestehende Netzwerke zu laden bzw. eigene Netzwerkdaten zu importieren und exportieren.

## Vorhandene Daten in R verwenden
*R* hat großartige Möglichkeiten, um schnell ein Netzwerk für Testzwecke zu generieren. Wir stellen hier nur einige Möglichkeiten vor.

### Was ist ein igraph-Objekt?
Wir verwenden für die Analyse und Visualisierung von Netzwerken vor allem das Paket *igraph*. Deshalb lernen Sie zunächst die Konventionen für das *igraph*-Objekt kennen. Ein ***igraph*-Objekt** ist ein spezielles Datenformat des *igraph*-Pakets in *R*. Die Konvention des Pakets ist sehr einfach zu verstehen, da sie immer gleich aussieht.

`> library(igraph) # lädt das *igraph*-Paket`

`> library(igraphdata) # lädt das *igraphdata*-Paket`

`> data(package="igraphdata") # Inhalt des Pakets in der Übersicht`

`> data(karate) # lädt den Datensatz karate`

`> ?karate # Infos über den Datensatz karate unter dem Reiter „help“`

`> karate # ruft das *igraph*-Datenset karate auf`

Wenn der Datensatz karate erfolgreich als *igraph*-Datensatz geladen wurde, erscheint in der Konsole eine Zusammenfassung der Daten:

`> IGRAPH 4b458a1 UNW- 34 78 -- Zachary's karate club network`

`+ attr: name (g/c), Citation (g/c), Author (g/c), Faction (v/n), name (v/c), label`

`| (v/c), color (v/n), weight (e/n)`

`+ edges from 4b458a1 (vertex names):`

` [1] Mr Hi  --Actor 2  Mr Hi  --Actor 3  Mr Hi  --Actor 4  Mr Hi  --Actor 5  Mr Hi  --Actor 6 `

` [6] Mr Hi  --Actor 7  Mr Hi  --Actor 8  Mr Hi  --Actor 9  Mr Hi  --Actor 11 Mr Hi  --Actor 12`

`[11] Mr Hi  --Actor 13 Mr Hi  --Actor 14 Mr Hi  --Actor 18 Mr Hi  --Actor 20 Mr Hi  --Actor 22`

`[16] Mr Hi  --Actor 32 Actor 2--Actor 3  Actor 2--Actor 4  Actor 2--Actor 8  Actor 2--Actor 14`

`[21] Actor 2--Actor 18 Actor 2--Actor 20 Actor 2--Actor 22 Actor 2--Actor 31 Actor 3--Actor 4 `

`[26] Actor 3--Actor 8  Actor 3--Actor 9  Actor 3--Actor 10 Actor 3--Actor 14 Actor 3--Actor 28`

`[31] Actor 3--Actor 29 Actor 3--Actor 33 Actor 4--Actor 8  Actor 4--Actor 13 Actor 4--Actor 14`

`+ ... omitted several edges`

Jedes *igraph*-Objekt ist genau gleich aufgebaut:

* **IGRAPH** zeigt an, dass es sich um ein Objekt der Klasse „igraph“ handelt und beschreibt die intern vergebene Nummer des *igraph*-Objekts. Diese unterscheidet sich jedes Mal beim Laden, da der Datensatz neu geladen wird.
* Die **vierstellige Buchstabenfolge** danach ist wie folgt codiert:
  1. **Art des Netzwerks**: **U** = undirected (ungerichtet), **D** = directed (gerichtet)
  2. **Bezeichnung der Knoten**: **N** = named, dazu muss ein Vertex-Attribut „name“ vorliegen
  3. **Gewicht**: **W** = weighted network, d.h. die Edgelist ist mit einem numerischen Wert gewichtet
  4. **Two-Mode-Netzwerk**: **B** = bi-partite (oder two-mode Netzwerk), wenn das Vertex-Attribut „type“ vorhanden ist. Fehlt eine Codierung, wird dies einfach mit einem „–“ angezeigt.
  
* Im Falle des karate Datensatzes haben wir es also mit einem ungerichteten, aber klar identifizierbaren und gewichteten one-mode Netzwerk zu tun.
* Die Zahlenfolge nach der Codierung gibt die Zahl der Knoten und Edges an, in diesem Fall **34 Knoten mit insgesamt 78 Edges**.
* Danach folgt die Nennung der im Graphen angelegten Attribute. Diese entsprechen in der Regel der Bezeichnung der Spalten im Header und werden genauso übernommen. Hinter jedem Attribut steht eine Klammer, die die Art des Attributs genauer beschreibt, etwa (v/n): Die **erste Nennung** vor dem Trennstrich bezieht sich auf die Ebene des Attributs:
  * **g** meint, dass sich das Attribut auf den gesamten Graphen bezieht
  * **v** meint, dass sich das Attribut auf die vertices oder Knoten bezieht
  * **e** meint, dass sich das Attribut auf die edges oder Kanten bezieht
  
Beispielsweise beziehen sich die Graph-Attribute „name“, „Citation“ und „Author“ ausschließlich auf den gesamten Graphen, während die Vertex-Attribute „Faction“, „name“, „label“ und „color“ sich auf die einzelnen vertices/Knoten beziehen. Es gibt im Datensatz nur ein edge-Attribut, nämlich das Gewicht („weight“).

Die **zweite Nennung** in der Klammer gibt an, wie die Werte des Attributs codiert sind, in der Regel sind dies **c** für characters, also Text, und **n** für numerische Werte, also Zahlen. Beispielsweise hat der Datensatz numerische Werte nur bei den Attributen „Faction“, „color“ und „weight“.

Nach diesem Überblick zeigt die Zusammenfassung exemplarisch die Struktur des Netzwerks an.

Das [*R*-Skript zum Laden des Datensatzes karate](https://e-learning.hdm-stuttgart.de/moodle/pluginfile.php/131042/mod_book/chapter/195/226305%20R%20Skript%20igraphdata%20karate%20laden.r) können Sie hier herunterladen.

### Zufällige Netzwerke generieren
Mit R lassen sich einfach und schnell beispielhafte Netzwerke erstellen, um z.B. Visualisierungen oder Berechnungen zu üben. Diese unterscheiden sich in der Art und Weise der Netzwerkdaten:

1. **Preferential Attachment Networks**

Bei diesen Netzwerken ist **jeder Knoten mit genau einem anderen Knoten verbunden**. Dies ist häufig der Fall, wenn nach genau einer Beziehung gefragt wird. (z.B. "wichtigster Mensch", "bester Freund" etc.). Die Funktion zur Erstellung eines PAN lautet [sample_pa](http://igraph.org/r/doc/sample_pa.html) und hat einige Argumente:

`> pa <- sample_pa(n, power = 1, directed = TRUE)`

**n** entspricht der Anzahl der Knoten, **power** der Stärke der Beziehung, d.h. 1 ist linear, **directed** beschreibt, ob das Netzwerk gerichtet oder ungerichtet ist und kann die Werte TRUE oder FALSE annehmen.

Für ein Netzwerk mit 25 Knoten, das linear und ungerichtet ist, sieht der Befehl also wie folgt aus:

`> # Beispiel für ein Preferential Attachment Network mit 25 Knoten, ungerichtet`

`> pa25 <- sample_pa(25, power = 1, directed = FALSE) # erstellt das Netzwerk und ordnet es der Variablen pa25 zu`

`> pa25 # ruft die Zusammenfassung des igraph Objekts auf`

`> plot(pa25) # erstellt eine simple Visualisierung des Objekts`

![pa25](/00_images/PA.png)

Der Graph zeigt, dass jeder der 25 Knoten nur mit einem anderen Knoten verbunden ist. Es ist schnell sichtbar, dass die Knoten 1,2, und 3 die Startknoten waren, um die sich die anderen Knoten formiert haben.

Beachten Sie, dass jede Visualisierung etwas anders aussieht, da der Algorithmus die Anordnung der Knoten jedes Mal neu und anders berechnet.

*Was passiert wohl bei einem Netzwerk mit 10, 50 oder 100 Knoten? Wie lässt sich dies erklären?*

2. **Zufallsnetzwerke**

Bei Zufallsnetzwerken werden die Netzwerke nach einem Zufallsprinzip erzeugt. Hier stehen mehr Befehle zur Verfügung, um das Netzwerk entsprechend zu modellieren. Der Befehl ist "[sample_gnp](http://igraph.org/r/doc/sample_gnp.html)" und bezieht sich auf eine statistische Zufallsverteilung. Der Befehl lässt sich sehr einfach modellieren:

`> sample_gnp(n, p, directed = FALSE, loops = FALSE)`

**n** steht wieder für die Anzahl der Knoten im Netzwerk, **p** steht für die Wahrscheinlichkeit, dass eine Verbindung zwischen zwei Knoten besteht (in Prozentwerten ausgedrückt, d.h. 0,1 sind 10% Wahrscheinlichkeit, 0,673 sind 67,3%), das Netzwerk kann über den Befehl **directed** als gerichtet oder ungerichtet dargestellt werden und **loops** definier, ob ein Knoten auf sich selbst beziehen kann (in der Regel schalten wir das aus).

`> # Beispiel für ein Zufallsnetzwerk mit 38 Knoten und einer Wahrscheinlichkeit von 17%, dass es eine Beziehung zwischen Knoten gibt`

`> gnp38 <- sample_gnp(38, 0.17, directed = FALSE, loops = FALSE) # erstellt das Netzwerk`

`> gnp38 # ruft die Zusammenfassung des igraph Objekts auf`

`> plot(gnp38) # erstellt eine simple Visualisierung des Objekts`

![pgnp38](/00_images/GNP.png)

In dem Graphen ist ein beispielhaftes Netzwerk entsprechend visualisiert. Es unterscheidet sich deutlich von dem PA-Netzwerk oben, da hier auch mehrere Beziehungen zwischen den Knoten möglich sind.

In der Regel ist die Wahrscheinlichkeit der Vernetzung in den meisten Netzwerken deutlich geringer. Wir verstehen unter dem gesetzten Wert P (Wahrscheinlichkeit der Vernetzung zwischen Knoten) auch die Dichte eines Netzwerks, die wir bei den Netzwerkmaßen visualisieren können.

*Variieren Sie jetzt die Anzahl der Knoten von 10 bis 100 und die Wahrscheinlichkeit der Vernetzung. Was fällt Ihnen bei der Visualisierung auf?*

[R-Skript zur Entwicklung von Zufallsnetzwerken](https://e-learning.hdm-stuttgart.de/moodle/pluginfile.php/131042/mod_book/chapter/185/226305%20R%20Skript%20Random%20Networks.r).

### Paket network: Datenimport
Im Paket "network" sind einige Datensätze hinterlegt, die auch für uns interessant sind. Das Paket Network eigenet sich vor allem für die statistische Analyse von Netzwerkdaten. Sie lernen hier, wie man den Datensatz aus dem network Paket nach igraph importiert.

`> library(network) # lädt das Paket network`

`> data(flo) # lädt das Netzwerk der florentinischen Heiraten nach Padgett`

`> flo # zeigt die Matrix-Daten des Netzwerks an: Jede Heirat/Beziehung ist mit 1 markiert`

Da die Daten als Matrix bereits vorliegen, lassen sich diese leicht in ein igraph Objekt umwandeln.

`> iflo <- graph_from_adjacency_matrix(flo, mode = "undirected") # Matrix wird in ein igraph Objekt umgewandelt`

`> iflo # zeigt das igraph Objekt an`

`> plot(iflo) # erste Visualisierung`

Alle Matrix-Daten können einfach mit dem Befehl [graph_from_adjacency_matrix](http://igraph.org/r/doc/graph_from_adjacency_matrix.html) in ein igraph Objekt umgewandelt werden.

* [R Skript](https://e-learning.hdm-stuttgart.de/moodle/pluginfile.php/131042/mod_book/chapter/187/226305%20R%20network%20paket%20igraph.r)
* Original Quelle des Datensatzes: Padgett, J. F. and Ansell, C. K. (1993). Robust Action and the Rise of the Medici, 1400-1434. ***America Journal of Sociology***, 98(6), 1259-1319.

### Paket igraphdata
Das Paket "igraphdata" enthält viele nützlichen Datensätze, die bereits im igraph-Format angelegt sind.

`> library(igraphdata) # lädt das igraphdata Paket`

`> data(package="igraphdata") # liefert einen Überblick über den Inhalt des Pakets`

`> data(enron) # lädt den Datensatz enron`

`> enron # zeigt das igraph Objekt enron an`

`> ?enron # ruft die Hilfefunktion auf, die den Datensatz enron erklärt`

Um zu erfahren, was sich hinter dem Datensatz enron verbirgt, laden Sie den Datensatz enron und lesen Sie dessen Beschreibung durch.

## Dateien und Datensätze einlesen
In der Regel erheben wir die Daten nicht direkt in R, sondern haben die Datensätze in Tabellen abgelegt. Diese Daten kann R einlesen. Dazu muss man sich aber stets vergegenwärtigen, in welchem Format die Daten abgelegt sind. Die meisten Daten, die wir verwenden, liegen als .txt oder .csv Dateien vor.
### Daten erfassen und bereinigen
Ganz wichtig: Mit Excel (MS Office) gibt es immer wieder Schwierigkeiten. Deshalb sollte die Datenerhebung bzw. die Erstellung von Listen nicht in Excel gemacht werden. Verwenden Sie stattdessen Google Tables (gemeinsame Bearbeitung) oder Open Office bzw. Libre Office. In allen Dokumenten können Sie die Dateien als CSV importieren.

Ich empfehle zur Überprüfung dem Text-Editor [Atom](https://atom.io/). Für die Bereinigung sollten Sie auf normale Textverarbeitungen wie Word oder ähnliches verzichten, weil diese Sonderzeichen in der Textdatei anlegen.

**Achtung: Vermeiden Sie in jedem Fall Sonderzeichen wie Umlaute oder ähnliches und bereinigen Sie die Daten vorher!**
### Daten einlesen
#### Über den Wohlleben Datensatz
Ralf Wohlleben gilt als ["Mastermind um den NSU"](https://www.tagesspiegel.de/politik/nsu-prozess-ralf-wohlleben-der-starke-arm-des-nsu-nach-draussen/20133284.html). Ich habe über frei zugängliche Quellen versucht, das Ego-Netzwerk um Ralf Wohlleben zu rekonstruieren. Das Netzwerk ist ein two-mode (bi-partite) Netzwerk, das aus Personen und Organisationen besteht. Falls möglich (und nötig) habe ich die Beziehungen bis zur zweiten oder dritten Ebene von Wohlleben erstellt.

#### Import von Daten aus einer Edgelist
Der Import von Daten in R ist einfach, wenn Sie einige Grundregeln beachten. Sicher Sie sich den Datensatz Wohlleben, bestehend aus einer Edgelist und einer Nodelist zunächst in Ihrem Working Directory. Mit dem Befehl "read.csv()" können Sie dann die csv-Dateien einfach einlesen.

1. Edgelist

`> edges <- read.csv("wohl_edge.csv", header=T, as.is=T) # liest die Edgelist ein und ordnet sie der Variablen edges zu`

`> edges # zeigt die edges-Daten aus der csv Datei in der Konsole an`

`> head(edges) # zeigt lediglich die ersten Zeilen des Datensatzes an`

2. Nodelist

Nodelists werden genauso wie Edgelists importiert. Die Anzahl und Bezeichnungen der IDs zwischen der Edge- und Nodelist müssen genau übereinstimmen, sonst kann es zu Fehlern im Datensatz kommen. Man muss keine Nodelist importieren. Liefert die Nodelist jedoch wichtige Informationen zu den Nodes, ist ein Import ratsam.

`> nodes <- read.csv("wohl_node.csv", header=T, as.is=T) # liest die Nodelist ein und ordnet sie der Variablen nodes zu`

`> nodes # zeigt die nodes-Daten aus der csv Datei in der Konsole an`

`> head(nodes) # zeigt lediglich die ersten Zeilen des Datensatzes an`

#### Erstellung eines igraph Objekts
Die Edgelist ist jetzt eingelesen, aber bisher noch nicht als Matrix hinterlegt. Für igraph müssen die Objekte jedoch als Matrix hinterlegt sein. Deshalb wandeln wir die Edgelist nun mit dem Befehl "as.matrix()" um.

`> ties <- as.matrix(edges) # wandelt die Edgelist in eine Matrix um; ordnet die Matrix der Variablen ties zu`

Nun können wir aus der vorhandenen Matrix ein igraph Objekt erstellen. Wenn man nur die Edgelist importiert hat, erstellt man das igraph Objekt mit dem Befehl graph_from_edgelist. Das Wohlleben Objekt haben wir als ungerichtet angegeben, da nicht ersichtlich ist, wer die jeweilige Beziehung initiiert hat.

`> wohled <- graph_from_edgelist(ties, directed=FALSE)`
`> wohled # zeigt das igraph Objekt wohled an

Habe ich neben einer Edge- auch eine Nodelist importiert und möchte die Daten aus der Nodelist in mein igraph-Objekt integrieren, nutze ich den Befehl graph_from_data_frame. Das Objekt übernimmt die Daten aus der Nodelist und ist als ungerichtet angegeben. Möchte man ein gerichtetes Netzwerk erstellen, gibt man für directed=T an.

`> wohledno <- graph_from_data_frame(d=ties, vertices=nodes, directed=F)`

Führt man nun plot(wohl) oder plot(wohledno aus, sieht das Ganze ein wenig unübersichtlich aus. Deshalb passen wir die Visualisierung mit dem folgenden Befehl an:

`> plot(wohled, vertex.size=degree, vertex.label=NA, edge.arrow.width=0.4)`

bzw.

`> plot(wohledno, vertex.size=degree, vertex.label=NA, edge.arrow.width=0.4)`

Die Objekte wohled und wohledno beschreiben dasselbe Netzwerk. Der einzige Unterschied besteht darin, dass im Objekt wohledno die Daten der Nodelist integriert sind. Im nächsten Schritt sehen Sie, dass bei wohledno daher mehr Knotenattribute bestehen als bei wohled.

#### Attribute
Solange man nur die Edgelist einliest und die Nodelist noch nicht eingelesen ist (-> wohled Objekt), haben die Knoten des Wohlleben-Netzwerks nur ein Attribut: Ihren Namen. Eine Aufstellung der vorhandenen Knotenattribute erhält man durch den Befehl:

`> list.vertex.attributes(wohled)`

Ist auch die Nodelist eingelesen, ergeben sich für die Knoten mehrere Attribute. Beim Wohlleben-Netzwerk sind das die Attribute name, label, art, geschlecht, zweck und type. Die Attribute werden aus dem Header der Nodelist entnommen. Man erhält die vorhandenen Knotenattribute durch den Befehl:

`> list.vertex.attributes(wohledno)`

#### Für Fortgeschrittene
Damit auch sichtbar wird, dass sich das Netzwerk tatsächlich unterscheidet, lassen sich nun die Daten z.B. nach Personen (Kreise) und Organisationen (Quadrate) aufteilen. Wir weisen dazu die entsprechenden Werte den Vertex-Attributen zu. Dies funktioniert nur für das Objekt wohledno.

`> V(wohledno)[V(wohledno)$type == 1]$shape <- "square" # ordnet allen Typen, die den Wert 1 annehmen, Quadrate zu`

`> V(wohledno)[V(wohledno)$type == 0]$shape <- "circle" # ordnet allen Typen, die den Wert 0 annehmen, Kreise zu`

`> plot(wohledno, layout=layout_with_kk, vertex.size=degree, vertex.label=NA, edge.arrow.width=0.4)`

#### Zusammenfassung
Sie haben gelernt, wie man einen selbst erhobenen Datensatz zunächst in ein einfaches edgelist-Format überträgt. In einem zweiten Schritt lässt sich diese Edgelist mit einer Nodelist verbinden. Die Verbindung mit einer Nodelist ist nicht immer erforderlich, liefert uns aber viel mehr Daten und Analysemöglichkeiten. Es ist deshalb notwendig, sich vor einer Erhebung zu überlegen, welche Daten relevant sind.

[**R-Skript zum Wohlleben-Datensatz(Download)**](https://e-learning.hdm-stuttgart.de/moodle/pluginfile.php/131042/mod_book/chapter/183/Skript%20Wohlleben_Datensatz.R)
