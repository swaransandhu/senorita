# Beispiel für ein Netzwerkprojekt: Das Oscar-Netzwerk

In diesem Abschnitt werden viele der gelernten Befehle und Arbeitsschritte aus den vorherigen Kapitel praktisch angewandt. Dafür wurde eigens ein kleines Netzwerk erhoben. Das Projekt ist lediglich als Anschauung konzipiert und erhebt nicht den Anspruch, eine vollwertige Netzwerkforschung zu sein.

## Operationalisierung
Bevor man ein Projekt beginnt, sollte man mehrere Dinge genau abklären. Dazu gehören das **Thema**, das zugrundeliegende **Interesse und die Relevanz**, der **Datenzugang** und die **Forschungsfrage**.

Themen und Ideen für ein spannendes Netzwerkprojekt findet man im Grunde überall. Wir sind umgeben von Netzwerken, die erforscht werden können. Bei diesem Projekt wurden die Engagements Oscar-prämierter Schauspieler betrachtet. Das zugrundeliegende Interesse besteht darin, zu untersuchen, inwiefern jene Schauspieler über gemeinsame Projekte in Verbindung stehen und ob „gute“ Schauspieler in einem dichteren Netzwerk zueinander stehen, da sich die Regisseure womöglich von einem Engagement mehrerer guter Schauspieler einen besseren Film versprechen.

Bei der Abklärung des Forschungsinteresses und der -relevanz sollte man sich nicht nur auf seine eigene Einschätzung verlassen, sondern einschlägige Literaturen lesen und bearbeiten. Eine hohe Relevanz haben Themen, die einen Einfluss auf andere Bereiche haben und noch nicht hinreichend erforscht wurden. Ein Thema kann sich auch erst durch die Recherche ergeben, beispielsweise, wenn man Lücken in bestehenden Forschungen schließen möchte. In dem Fall ist die Relevanz nahezu automatisch gegeben.

Der Datenzugang muss vorab genau geklärt werden. Im Falle dieses Netzwerks war es möglich, qualitativ hochwertige Informationen über Portale wie IMDB zu erhalten. Eine solch gute Datenquelle im Internet zu finden, ist jedoch nicht die Regel, sondern eher die Ausnahme. Manchmal geht es jedoch nicht anders, als unzureichende Quellen zu nutzen. Dann müssen die Limitationen dieser Quellen im Forschungsbericht genannt und reflektiert werden. Die natürlichste Form der Datenquelle innerhalb einer Netzwerkforschung ist das Interview mit Akteuren, wobei man hier oft Abstriche in der Qualität der Daten machen muss, da nicht alle Akteure einer Gruppe an der Forschung teilnehmen möchten oder ein gewisses Bias in den Köpfen der Befragten entsteht.

Die Forschungsfrage sollte konkret und nicht „ins Blaue“ formuliert werden. Es lohnt sich, das erwünschte Forschungsfeld vorab explorativ zu ergründen, um interessante Aspekte aufzuwerfen. Überhaupt lohnt sich ein breit ausgelegter „Pre-Test“, um zu schauen, ob sich überhaupt ein Netzwerk ergibt.

## Erhebung und Bereinigung
Für die Erhebung der Daten wurde ausschließlich *Google Tables* genutzt. Zur Überprüfung der Daten wurde *RStudio* verwendet. Zunächst wurde erhoben, in welchen Filmen die Schauspieler gespielt haben. Dabei wurden – da es sich hierbei um ein bi-partites Netzwerk handelt – die Filme als weitere Akteure behandelt. In der Edgelist wurde in den *from*- und *to*-Spalten also jeweils ein Schauspieler-Film-Pärchen abgetragen. Das Beziehungsgewicht wurde in der Spalte *weight* festgehalten. Die ersten Zeilen der fertigen Edgelist sehen folgendermaßen aus:

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

### Netzwerkmaße
Die **Dichte** berechnen wir mithilfe von

`> edge_density(oscar)`

Als Ergebnis erhalten wir 0.015, also sind 1,5 Prozent der möglichen Kanten tatsächlich realisiert. Das Netzwerk hat demnach eine sehr geringe Dichte. Rein technisch betrachtet ist die Dichte deswegen gering, da das Netzwerk in mehrere Komponenten zerfällt. Wir überprüfen diese Annahme schnell mit dem folgenden Befehl.

`> components(oscar)`

Das Netzwerk hat neun Komponenten. Das bedeutet, dass eine Menge Kanten allein dadurch entfallen, da es keine Verbindungen zwischen den Komponenten gibt. Zudem haben die meisten Filme lediglich eine Verbindung zu einem Akteur. 

Der **Triadenzensus** kann für das Netzwerk nicht durchgeführt werden, da es ungerichtet ist und die Triaden-Typen nicht abgebildet werden können. Dafür kann man jedoch den **Cliques**-Befehl anwenden und die Anzahl der Knoten auf mini- und maximal drei stellen.

`> cliques(oscar, min="3", max="3")`

Als Ergebnis erhalten wir list(), das bedeutet, dass es keine Ergebnisse gibt. Diesen Umstand können wir uns leicht erklären. Eine Clique mit drei Knoten, also eine Triade, ist schlicht eine unmögliche Konstellation innerhalb dieses Netzwerks. Das liegt daran, dass die Kanten jeweils zwischen Schauspielern und Filmen liegen und nicht zwischen Akteuren desselben Typs. Drei Knoten können daher unmöglich zueinander in Verbindung stehen, da mindestens eine Kante innerhalb einer derartigen Triade zwischen zwei Filmen oder Schauspielern existieren müsste. Im Klartext bedeutet das, dass das Netzwerk lediglich aus Dyaden besteht. Die einzige Cliquen-Form besteht demnach aus zwei Knoten. Die Anzahl der max cliques und largest cliques beträgt jeweils 257 und bietet keinen Mehrwert oder Erkenntnisgewinn.Verdoppelt man die 257, kommt man übrigens auf 514 Beziehungen. Das igraph-Objekt hat jedoch 516 Beziehungen. Wohin die letzte Dyade verschwunden ist, wird an dieser Stelle nicht klar, macht jedoch aus Sicht der Forschung keinen Unterschied. 

Die am **weitesten voneinander entfernten Knoten** ermitteln wir mit dem Befehl:

`> farthest_vertices(oscar)`

Als Ergebnis erhalten wir zwei Filme – 12 Years a Slave und Black Swan. Zwischen ihnen liegen 16 Kanten. Diese Berechnung hat jedoch keinerlei Aussage oder Logik, da man nicht „über Schauspieler zu Filmen läuft“ oder Filme geographisch, emotional etc. weiter oder näher zueinander liegen können.

Die **mittlere Pfaddistanz** erhalten wir mithilfe von:

`> mean_distance(oscar)`

Sie liegt bei etwa 6 Kanten. Der hohe Wert lässt sich damit erklären, dass wir ein dyadisch aufgebautes Netzwerk haben. Einen Mehrwert bietet dieser Wert jedoch ebenfalls nicht. Die Berechnung des **Durchmessers** macht an dieser Stelle ebenfalls keinen Sinn.

### Akteursmaße
Den **Degree** der Knoten berechnen wir mithilfe von:

`> degree(oscar)`

Dabei interessieren uns vorrangig die Degrees der Schauspieler. Je mehr Degrees ein Schauspieler hat, in desto mehr Projekten hat er im Beobachtungszeitraum mitgewirkt. Ein höherer Degree-Wert kann damit (vorsichtig!) als eine bessere Auftragslage interpretiert werden. In der Interpretation würde man nun auffällige, also besonders hohe und niedrige, Werte näher betrachten und die betroffenen Knoten auf ihre Attribute hin untersuchen. Die Degree-Werte kann man natürlich auch normalisieren, um eine bessere Vergleichsbasis zu schaffen.

`> degree(oscar, normalized = TRUE)`

Mit der **Betweenness-Zentralität** prüft man, ob es Akteure gibt, die eine gewisse Brokerage-Position einnehmen.

`> betweenness(oscar)`

Die Berechnung der Betweenness macht jedoch wenig Sinn, da die Kanten nicht die nötige Beschaffung für eine Brokerage-Betrachtung bieten. 

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

Die Breite der Kanten soll sich am Gewicht der Kanten orientieren. Dafür fügen wir hinzu:

`> plot(oscar, vertex.color=vcoloscar, vertex.label = ifelse(V(oscar)$type == "2", V(oscar)$name, NA), vertex.size = ifelse(V(oscar)$type == "2", degree(oscar)/3, 3), layout = coords, rescale = FALSE, ylim=c(-1.5,2.2),xlim=c(-0.5,0.5), edge.width=E(oscar)$weight)`

![Layout](/00_images/EdgeOscar.png)

Nehmen wir noch ein paar letzte Schönheitsanpassungen vor. Wir verändern die Knotenumrissfarbe, die Label-Schriftart, -farbe und -größe sowie die Distanz des Labels zum Knoten.

`> plot(oscar, vertex.color=vcoloscar, vertex.label = ifelse(V(oscar)$type == "2", V(oscar)$name, NA), vertex.size = ifelse(V(oscar)$type == "2", degree(oscar)/3, 3), layout = coords, rescale = FALSE, ylim=c(-1.5,2.2),xlim=c(-0.5,0.5), edge.width=E(oscar)$weight, vertex.frame.color = "transparent", vertex.label.family = "Helvetica", vertex.label.color = "black", vertex.label.cex=c(0.7), vertex.label.dist=-2)`

![Visualisierung](/00_images/VisualOscar2.png)

In diesem Fall gefällt uns das Ergebnis und wir beschließen vorerst die Visualisierung. Natürlich kann man noch eine Menge anderer Dinge anpassen und individualisieren.

## Interpretation der Daten und Ausblick
Zum Schluss jedes Projekts sollten die erfassten Daten und Beobachtungen ausgewertet und interpretiert werden. Wenn möglich, sollten Sie sich ebenfalls darum bemühen, Hypothesen aus ihren Beobachtungen zu ziehen. Achten Sie jedoch darauf, dass man selten kausale Beziehungen unterstellen kann und diese höchstens im Rahmen einer Vermutung aussprechen möge. Bei einem Netzwerk wie diesem ist es beispielsweise problematisch, präskriptive Aussagen über die Beziehungen zu treffen, da Schauspieler aus ganz unterschiedlichen Gründen für Produktionen engagiert werden. Eine Hypothese à la: „Colin Firth hat keine Freunde innerhalb der Oscar-Gemeinde, da er innerhalb des Netzwerks exkludiert ist“, wäre absolut falsch und nicht gerechtfertigt. Diese Unterstellung fehle zudem jedwede wissenschaftliche Basis.

Orientieren Sie sich daher zunächst an deskriptiven Aussagen und setzen Sie die Akteurs- und Netzwerkmaße in einen logische Zusammenhang. Versuchen Sie, anhand der Knotenattribute andere Perspektiven einzunehmen. Vielleicht bilden sich ja Geschlechter-spezifische Untergruppen? Hier wäre es natürlich ratsam gewesen, eine Menge weiterer Knotenattribute zu erfassen, beispielsweise das Genre der Filme oder das Alter und die Herkunft der Schauspieler.

Ziehen Sie die Netzwerkmechanismen in Ihre Betrachtungen hinzu und behelfen Sie sich mit einschlägigen Literaturen, um Ihre Ergebnisse auszuwerten und zu prüfen. Sprechen Sie mit Ihren Kommilitonen und versuchen Sie, möglichst viele Eindrücke zu gewinnen. Bleiben Sie jedoch bei den „harten Fakten“.

Zuletzt sollten Sie ebenfalls einen Ausblick bieten. Welche Forschungen könnten an Ihre anknüpfen, welche Lücken weist ihre Forschung auf, die eine weitergehende Betrachtung schließen könnte? Die Erfassung und Betrachtung weiterer Attribute sowie die Ausweitung des Forschungsgegenstands zählen hier dazu.

### Tipp für einen spannenden Forschungsbericht
Forschung ist nicht nur dafür da, neue Erkenntnisse zu gewinnen und unbekannte Bereiche zu ergründen, sondern auch, um andere zu begeistern. Versuchen Sie daher, innerhalb des Berichts und während Ihres gesamten Forschungsprozesses eine Art Storyline zu verfolgen. Eine feste Linie kann Ihnen ebenfalls dabei helfen, Hypothesen aufzustellen und ein Forschungsziel in den Blick zu nehmen. Welche Geschichte wollen Sie mit dem Netzwerk erzählen, was bringt Sie dem Leser und welche Erkenntnisse gewinnt er durch Sie? Diese Frage sollten Sie ständig im Hinterkopf behalten.
