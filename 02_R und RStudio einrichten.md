# R und RStudio einrichten
In Lektion 2 lernen Sie, wie man Pakete in RStudio verwaltet und installiert. Das Paket [Swirl](http://swirlstats.com/) ist ein Selbstlernpaket zur Vertiefung in R.

Wer tiefer in R einsteigen möchte, sollte sich die kostenlosen Online-Kurse anschauen:

+ [Coursera R Programming](https://www.coursera.org/learn/r-programming#syllabus)
+ [Codeschool Try R](http://tryr.codeschool.com/)
+ [Datacamp Introduction to R](https://www.datacamp.com/courses/free-introduction-to-r)
+ [EdX Introduction to R](https://www.edx.org/course/introduction-to-r-for-data-science)

Deutschsprachige Kurse finden Sie z.B. bei [Video2Brain](https://www.video2brain.com/de/videotraining/r-und-rstudio-grundkurs) oder [Lynda](https://www.lynda.com/R-tutorials/Up-Running-R/120612-2.html?srchtrk=index%3a4%0alinktypeid%3a2%0aq%3aR%0apage%3a1%0as%3arelevance%0asa%3atrue%0aproducttypeid%3a2) (HdM VPN Zugang notwendig). 
## Pakete installieren
Wenn Sie R das erste Mal installieren, wird nur das Basis-System installiert. Alle weiteren Funktionen sind in sogenannten **Paketen (packages)** abgelegt. Pakete können individuell installiert werden. Dabei werden sie in Verzeichnissen abgelegt, die man **libraries** nennt. Achtung: **Package** und **library** meinen damit nicht dasselbe, sondern haben eher eine Beziehung wie ein Buch (=package) zu seinem Regal (=library)!

Mit RStudio ist es einfach, diese Pakete zu installieren.

Im Programmmenü wählen Sie "Tools" und "Install Packages". Wichtig ist, dass Sie im sich öffnenden Fenster "install dependencies" anhaken bzw. angehakt lassen. Das bedeutet, dass automatisch alle zusammengehörenden Pakete, die aufeinander aufbauen oder sich aufeinander beziehen, installiert werden. Sie können jetzt den Namen des Pakets eingeben und es installieren.

Es ist ebenfalls möglich, Pakete im Fenster unten rechts über den Reiter "Packages" zu installieren. Dort öffnet sich per Mausklick auf die Schaltfläche "Install" dasselbe Installationsfenster wie eben bereits erklärt. Das installierte Paket taucht dann in der Liste unter dem Reiter "Packages" auf.

Alternativ können Sie Pakete auch direkt über die Konsole mit dem folgenden Befehl installieren:

`> install.packages("hierderNamedesPakets") #Installation von Paketen`

Im Menü "Tools" können Sie auch überprüfen, ob die Versionen der Pakete noch aktuell sind. Dies wird unter "Check for Package Updates" angezeigt. Die Versionen der jeweiligen Pakete werden auch in der Liste im Reiter "Packages" angezeigt.

Eine [alphabetische Übersicht aller Pakete](https://cran.r-project.org/web/packages/available_packages_by_name.html) finden Sie auf CRAN. Übrigens werden die Pakete kostenlos und mit offener Quelle zur Verfügung gestellt. So können sie von der R-Community eigenständig und in Zusammenarbeit verbessert werden.
### Beispiel-Paket SWIRL installieren
Beispielhaft installieren wir gemeinsam das Paket "swirl". Swirl ist eine interaktive Lernumgebung für R.

1. Gehen Sie in RStudio über das Menü auf "Tools" und "Install Packages" (siehe vorheriges Kapitel). Geben Sie in das Fenster "swirl" ein. Setzen Sie den Haken bei "Install dependencies".

![Pakete installieren](/00_images/InstallPaket.png)

* Alternativ können Sie diesen Befehl auch direkt in die Konsole eingeben und auf Enter drücken:

`> install.packages("swirl") #Installation des Pakets swirl`

2. Installieren Sie nun "swirl". Dabei werden sämtliche Pakete, die zu swirl gehören, mit installiert.

3. Sie sehen den Verlauf der Installation direkt in der Konsole. Dabei werden auch die abhängigen Pakete automatisch mit heruntergeladen. Falls Sie in der Konsole gefragt werden: "Do you want to install from sources the packages which need compilation?", geben Sie "n" ein und drücken Sie Enter. Sobald Sie wieder ">" sehen und die Konsole keine weiteren Befehle ausführt, ist die Installation beendet.

4. Wenn Sie sich nun im unteren rechten Arbeitsfenster unter dem Reiter "Packages" die Pakete auflisten lassen, taucht auch "swirl" auf. Wenn Sie auf den **Namen des Pakets** klicken, erhalten Sie eine Übersicht über die Inhalte des Pakets und die wichtigsten Befehle, die das Paket beinhaltet. Das ist sehr hilfreich, um sich einen ersten Überblick zu verschaffen.

![Übersicht über das Paket](/00_images/UebersichtPaket.png)
### Paket swirl ausführen
Sie haben nun also Ihr Buch (=Paket) in Ihr Regal (=library) gestellt (=installiert). Um es zu nutzen, reicht dies jedoch nicht aus. Während Sie das Buch lesen müssten, um dessen Inhalt zu erfassen, müssen Sie Pakete **laden**, damit sie genutzt werden können. Wenn Sie Pakete zwar installieren, aber nicht laden, werden die Befehle, die auf dem Paket basieren, nicht von der Konsole ausgeführt. Erst, wenn Sie Pakete auch laden, kann die Konsole mit ihnen arbeiten.

Es gibt zwei Möglichkeiten, Pakete zu laden:

1. Mit einem Befehl in der Konsole:

`> library("swirl") # lädt das Paket swirl aus der library`

2. Unter dem Reiter "Packages". Im unteren rechten Fenster werden Ihnen im Reiter "Packages" die Pakete aufgeführt, die Sie bereits installiert haben. Links neben den Paketen gibt es jeweils die Möglichkeit, das Paket anzuhaken oder nicht. Ist ein Paket angehakt, ist es geladen. Ist es nicht angehakt, ist es zwar installiert, aber nicht geladen.
#### Swirl starten
Starten Sie nun das Paket mit dem Befehl:

`> swirl() #startet das Paket swirl`

![Swirl](/00_images/Swirl.png)

Sie sehen einen interaktiven Dialog, der Sie durch verschiedene Funktionen von R führt.
### Pro-Tipps: Kurzbefehle
In RStudio gibt es einige hilfreiche Kurzbefehle, die Ihnen das Leben sehr viel einfacher machen.

* **Auto-Vervollständigen via TAB oder ENTER**. Mit der Tab-Funktion werden eingegebene Codes, Variablen oder Dateien vorgeschlagen. Diese können mit TAB oder ENTER bestätigt und in der Konsole eingefügt werden. Das Drücken von Enter vervollständigt hierbei nur die vorgeschlagene Einheit und führt diese nicht aus. Wenn mehrere Einheiten vorgeschlagen werden, kann mit Pfeiltasten zwischen diesen gewählt werden.
* **Letzte Befehle wiederholen**: Häufig arbeiten wir mit den gleichen Codes bzw. variieren die Befehle nur geringfügig. Die letzten Befehle werden durch CTRL + Pfeil Auf (Mac: Command + Pfeil Auf) wieder aufgerufen. Das funktioniert aber nur in der Konsole.
* **Befehle ausführen**: Wir unterscheiden in R zwischem dem Editor (der Ort, an dem der Code oder das Skript geschrieben wird) und der Konsole, in der der Befehl ausgeführt wird. Um eine Code-Zeile im Editor auszuführen, wird die entsprechende Zeile ausgewählt, indem man den Cursor in sie setzt und mit CTRL + ENTER (Mac: Command + Enter) ausgeführt. Um mehrere Code Zeilen auszuführen, müssen diese zuvor ausgewählt und dann mit dem gleichen Befehl ausgeführt werden. Alternativ kann man im Editor auf den Befehl "run" klicken.

![Editor und Konsole](/00_images/Editor.png)
