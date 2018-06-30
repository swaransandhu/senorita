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
