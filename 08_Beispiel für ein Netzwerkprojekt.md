# Beispiel für ein Netzwerkprojekt: Das Oscar-Netzwerk

In diesem Abschnitt werden viele der gelernten Befehle und Arbeitsschritte aus den vorherigen Kapitel praktisch angewandt. Dafür wurde eigens ein kleines Netzwerk erhoben. Das Projekt ist lediglich als Anschauung konzipiert und erhebt nicht den Anspruch, eine vollwertige Netzwerkforschung zu sein.

## Operationalisierung

## Erhebung und Bereinigung
Für die Erhebung der Daten wurde ausschließlich *Google Tables* genutzt. Zur Überprüfung der Daten wurde *RStudio* verwendet. Zunächst wurde erhoben, in welchen Filmen die Schauspieler in den Jahren XX bis XX gespielt hatten. Dabei wurden – da es sich hierbei um ein bi-partites Netzwerk handelt – die Filme als weitere Akteure behandelt. In der Edgelist wurde in den *from*- und *to*-Spalten also jeweils ein Schauspieler-Film-Pärchen abgetragen. In der Spalte *weight* wurde festgehalten, XXXX. Die ersten Zeilen der fertigen Edgelist sehen folgendermaßen aus:

![Edgelist Oscar](/00_images/EdgelistOsc.png)

In der Nodelist wurde jeder Akteur in der Spalte *id* abgetragen. In der Spalte *label* steht der korrekte Name des Schauspielers oder Films. Die Spalte *type* legt fest, zu welchem Typus der Akteur jeweils gehört – 1 bedeutet, der Akteur ist ein Film, 2 bedeutet, er ist ein Schauspieler. Die Spalte *type* ist bei einem bi-partiten Netzwerk wie diesem unerlässlich. Die Spalte *sex* hat natürlich nur Sinn, wenn es sich bei dem Akteur um einen Schauspieler handelt. Auch hier wurde dichotom numerisch codiert – Frauen sind die 1, Männer die 2. Bei den Filmen wird NA eingetragen, was soviel wie „not available“ oder „not applicable“ bedeutet.

![Edgelist Oscar](/00_images/NodelistOsc.png)

### Bereinigung
Nach der Ersterhebung ist man meist leider noch nicht ganz fertig. In fast jedem Fall macht man bei der Erhebung Fehler, die man nachträglich bereinigen muss. Doch wie fallen einem diese Fehler überhaupt auf?

Zunächst sollte man beide Dateien als .csv-Dateien herunterladen. Die Daten in diesem Projekt wurden *oscared.csv* und *oscarnod.csv* genannt. Die Dateien müssen in Ihrem Arbeitsverzeichnis liegen, damit sie mit der folgenden Befehlskette in *RStudio* übertragen werden können:

`> oscared <- read.csv("oscared.csv", header=T, as.is=T) # Liest die Edgelist ein.`

`> oscarnod <- read.csv("oscarnod.csv", header=T, as.is=T) # Liest die Nodelist ein.`

`> oscared <- as.matrix(oscared) # Erstellt aus der Edgelist eine Matrix.`

`> oscar <- graph_from_data_frame(d=oscared, vertices=oscarnod, directed=F) # Fügt die Edge- und Nodelist zu einem *igraph*-Objekt zusammen.`

Nun passiert es, wie gesagt, ziemlich häufig, dass bei der Ausführung des letzten Befehls der folgende Fehler in der Konsole auftaucht:

`> Fehler in graph_from_data_frame(d = oscared, vertices = oscarnod, directed = F) : 
  Some vertex names in edge list are not listed in vertex data frame`

Der untere Satz ist für uns von Bedeutung. Er sagt aus, dass es zwischen der Edge- und Nodelist Ungereimtheiten gibt. Um genau zu sein, gibt es Akteure in der *from*- und *to*-Spalte der Edgelist, die in der *id*-Spalte der Nodelist nicht vorkommen oder andersherum. In den Akteursspalten der Edgelist dürfen nämlich nur genau die Namen eingetragen werden, die genauso in der *id*-Spalte stehen – nicht mehr und nicht weniger und vor allem nicht falsch geschrieben. Dazu gehören leider auch unsichtbare Fehler wie Leerzeichen am Ende der Begriffe. Nun muss man sich an die Arbeit machen und die Daten bereinigen. Es lohnt sich, erst einmal zu überprüfen, wie viele Akteure in der Nodelist stehen und ob deren Bezeichnungen Leerzeichen beinhalten. Dann können alle Eintragungen der *id*-, *from*- und *to*-Spalte in eine eigene Tabellenspalte untereinander eingesetzt und alphabetisch sortiert werden. Jetzt wird jeder Begriffsblock auf Fehler untersucht. Diese können dann in den Listen verbessert werden. Wurden alle Blöcke durchsucht, können die Listen wieder als .csv-Dateien heruntergeladen und in *R* implementiert werden. Das wird so lange gemacht, bis kein Fehler mehr angezeigt wird und das *igraph*-Objekt oscar erfolgreich erstellt werden kann.

Manchmal kann es auch passieren, dass Sie durch die Erhebung am Ende oder am Rand der Tabellen noch Eintragungen haben, die Sie eigentlich löschen wollten. Auch das kann dazu führen, dass Ihre Daten nicht richtig eingelesen werden können. Achten Sie am besten von Anfang an darauf, sauber zu erheben.

## Übertragung der Daten in R
Die finale Edgelist und die dazugehörige Nodelist liegen nun auf *GitHub* und können von dort bequem in *R* eingelesen werden. Dazu erstellen wir ein Skript und schreiben die folgenden Befehle hinein, die wir im letzten Kapitel bereits ähnlich gesehen haben:

`> oscared <- read.csv("https://raw.githubusercontent.com/SabethHdM/senorita/patch-2/skripte/oscared.csv", header=T, as.is=T, sep=",")`

`> oscarnod <- read.csv("https://raw.githubusercontent.com/SabethHdM/senorita/patch-2/skripte/oscarnod.csv", header=T, as.is=T, sep=",")`

`> oscared <- as.matrix(oscared)`

`> oscar <- graph_from_data_frame(d=oscared, vertices=oscarnod, directed=F)`

Wir haben nun unser finales *igraph*-Objekt oscar, das wir uns in der Konsole auch gleich einmal genauer anschauen:

`> oscar`


Wir erhalten das folgende Ergebnis.

![Edgelist Oscar](/00_images/oscar.png)

Bei oscar handelt es sich also um ein ungerichtetes, gewichtetes, bi-partites Netzwerk mit 262 namentlich benannten Knoten und 516 Kanten. Es gibt vier Knotenattribute, „name“, „label“, „type“ und „sex“. Es gibt lediglich ein Kantenattribut, „weight“. Zudem werden uns die ersten Zeilen der Edgelist angezeigt. Auffällig ist, dass das Attribut „weight“ mit einem „c“ gekennzeichnet wurde. Das bedeutet, dass das Gewicht mit characters, also Buchstaben angegeben wurde. Wenn wir das Attribut mit dem folgenden Befehl aufrufen, können wir diesen Umstand genauer unter die Lupe nehmen:

`> edge_attr(oscar)`

Wir sehen nur Zahlen. Auch nach einer schnellen Prüfung in unserer *Google Tabelle* fällt uns kein Fehler auf. An dieser Stelle kann erst einmal entschieden werden, dass dies das Projekt beziehungsweise die Daten nicht wirklich beeinflusst oder gefährdet. Das Sortieren und Unterscheiden nach den jeweiligen Gewichts-Ausprägungen sollte trotz allem funktionieren.

Wir können das Netzwerk kurz plotten, um einen ersten Eindruck von oscar zu erhalten:

> plot(oscar)

![Edgelist Oscar](/00_images/oscarplot.png)

Hier muss eindeutig noch eine Menge getan werden, damit das Netzwerk anschaulich wird.

## Berechnung relevanter Maßen

## Visualisierung

Da das Netzwerk zwei Knotentypen abbildet – Schauspieler und Filme –, ist es ratsam, diese Gruppen visuell zu differenzieren. Daher kümmern wir uns zunächst darum, die Knoten unterschiedlich einzufärben.

`> vcoloscar <- vcount(oscar)`

`> vcoloscar[V(oscar)$type == "1"] <- "green"`

`> vcoloscar[V(oscar)$type == "2"] <- "gold"`

Wenn wir nun das Netzwerk visualisieren, können wir vcoloscar für die Definition der Knotenfarbe nutzen.

`> plot(oscar, vertex.color=vcoloscar)`

![Grün und Gelb](/00_images/GruenGelb.png)

Spätestens jetzt sollten wir uns um die Knotenlabels kümmern, damit wir eine bessere Übersicht vom Netzwerk erhalten. Wir entscheiden, dass das Labeln der Filme nicht weiter relevant ist und uns nur die Bezeichnung der Schauspieler interessiert. Wir wollen also nur die Labels der Knoten behalten, deren Typ gleich zwei ist. Das können wir ganz einfach im Plot-Befehl festlegen.

`> plot(oscar, vertex.color=vcoloscar, vertex.label = ifelse(V(oscar)$type == "2", V(oscar)$name, NA))`

Im Klartext bedeutet das Attribut: „Wenn ein Knoten die type-Ausprägung „2“ hat, so wird sein Attribut „name“ als label festgelegt. Alle anderen Knoten, die dem type gleich 2 nicht entsprechen, haben kein Laben, da „NA“.“ Das Ergebnis lässt sich sehen:

![Labels](/00_images/Label.png)

Jetzt stören uns weniger die Labels als die Knoten selbst. Mit der Knotengröße verfahren wir daher ähnlich. Die Größe der Schauspieler soll anhand des Degrees bestimmt werden, die restlichen Knoten, also die Filme, sollen eine unveränderliche Größe haben. Das erreichen wir mit dem folgenden Argument: 

`> plot(oscar, vertex.color=vcoloscar, vertex.label = ifelse(V(oscar)$type == "2", V(oscar)$name, NA), vertex.size = ifelse(V(oscar)$type == "2", degree(oscar)/3, 3))`

Im Klartext: „Wenn ein Knoten die type-Ausprägung „2“ hat, so wird seine Größe anhand des Degrees bestimmt. Dabei wird der Degree geteilt, damit die Knoten nicht zu groß ausfallen. Alle anderen Knoten, die dem type gleich 2 nicht entsprechen, haben die Größe „3“.“

![Knotengröße](/00_images/Nodesize.png)

Jetzt kümmern wir uns um das Layout. Dafür legen wir zunächst eine Variable an. und passen dann das Netzwerk mit den x- und y-Koordinaten an das Fenster an. Achtung: hier muss man ausprobieren, bis es gut aussieht!

`> coords <- layout_with_kk(oscar)*0.2`
`> plot(oscar, vertex.color=vcoloscar, vertex.label = ifelse(V(oscar)$type == "2", V(oscar)$name, NA), vertex.size = ifelse(V(oscar)$type == "2", degree(oscar)/3, 3), layout = coords, rescale = FALSE, ylim=c(-1.5,2.2),xlim=c(-0.5,0.5))`

![Layout](/00_images/LayoutOscar.png)

Nehmen wir noch ein paar letzte Schönheitsanpassungen vor. Wir verändern die Knotenumrissfarbe, die Label-Schriftart, -farbe und -größe sowie die Distanz des Labels zum Knoten.

`> plot(oscar, vertex.color=vcoloscar, vertex.label = ifelse(V(oscar)$type == "2", V(oscar)$name, NA), vertex.size = ifelse(V(oscar)$type == "2", degree(oscar)/3, 3), layout = coords, rescale = FALSE, ylim=c(-1.5,2.2),xlim=c(-0.5,0.5), vertex.frame.color = "transparent", vertex.label.family = "Helvetica", vertex.label.color = "black", vertex.label.cex=c(0.7), vertex.label.dist=-2)`

![Visualisierung](/00_images/VisualOscar.png)

In diesem Fall gefällt uns das Ergebnis und wir beschließen vorerst die Visualisierung. Natürlich kann man noch eine Menge anderer Dinge anpassen und individualisieren.

## Interpretation der Daten und Ausblick
