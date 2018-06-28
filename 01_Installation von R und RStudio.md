# Installation von R und RStudio
In Lektion 1 lernen Sie, wie Sie R und RStudio auf Ihrem Laptop/PC installieren.
## Warum muss ich mit R und RStudio arbeiten?
Der Umgang mit komplexen Daten wird für Journalisten und Öffentlichkeitsarbeiter immer wichtiger. Je stärker die Digitalisierung in Kommunikationsprozesse eingreift, desto mehr Daten werden generiert, die ausgewertet werden können.
Es gibt derzeit viele Möglichkeiten, Daten auszuwerten. Das Angebot ist inzwischen unübersichtlich, die klassischen Anbieter sind SPSS, Matlab und Stata. Allerdings sind die Lizenzen für kommerzielle Software sehr teuer. Deshalb steigen immer mehr Hochschulen, aber auch Agenturen und Unternehmen, auf nicht-kommerziellen Lösungen um. R wird inzwischen auch verstärkt an deutschsprachigen Hochschulen und Universitäten als Standard-Paket für die sozialwissenschaftliche Datenanalyse eingesetzt [(Why learn R?)](http://www.northeastern.edu/levelblog/2016/05/17/why-learn-r/).

Mit R erhalten Sie Zugang zu einem Werkzeugkasten der Datenanalyse und -visualisierung, den Sie im Lehrforschungsprojekt aber auch in der Bachelor-Arbeit gut einsetzen können.

## Installation von R
R lässt sich auf der Seite R-Project.org herunterladen. In der Regel wird die letzte stabile Version für Ihr Betriebssystem automatisch angezeigt. Achten Sie bitte darauf, dass Sie die aktuelle Version installieren.

Das R-Projekt ist in sogenannten CRANs abgelegt. Das sind Archive, die auf Servern liegen. Nutzen Sie den [CRAN-Server der Universität Münster](https://cran.uni-muenster.de/), um R zu installieren und wählen Sie das richtige Paket für Ihr Betriebssystem aus.

Mac: Laden Sie das aktuelle .pkg herunter und installieren es per Doppelklick im Verzeichnis Programme.

Windows: Laden Sie die aktuelle "base" Installation *.exe herunter und starten Sie den Installer per Doppelklick.

Testen Sie, ob R auf Ihrem System läuft, indem Sie das Programm mit einem Doppelklick starten. Das gilt für Mac sowie für Windows. Sie sollten dann die R-Konsole als Kommandozeile sehen, wie der untenstehende Screenshot anzeigt.

![R Konsole](/00_images/RKonsole.png)

Testen Sie die Installation, indem Sie "version" in die Kommandozeile eingeben und Enter drücken. Sie erhalten dann einen Output über die aktuell installierte Version.

**Video-Tutorial zur Installation von R.**

![R Konsole](/00_images/RKonsole.png)

## R und die Kommadozeile
Die erste Begegnung mit R kann etwas verwirrend sein, da R ein Kommandozeilen-Programm ist. Das heißt, dass es keine bunten Icons oder eine grafische Oberfläche gibt, auf die man klicken kann (wie in MS-Office), sondern jeder Befehl manuell als Textbefehl eingegeben werden muss. Grafische Oberflächen führen diese Befehle für den Nutzer automatisch im Hintergrund aus. Dabei kann man nur schwer durchschauen, was ein Klick auf die Schaltfläche nun genau auslöst. Mit einem Kommandozeilen-Programm wie R hat man also theoretisch gesehen eine viel genauere Kontrolle über das, was man gerade bearbeitet.

Auch unter Windows (ausführen > cmd.exe) und Mac (Terminal) kann mit Kommandozeilen gearbeitet werden. Linux ist ohnehin Kommandozeilen-basiert.

### Syntax-Konventionen bei R
**#** erläutert eine Code-Zeile und entspricht damit dem Kommentar. Zeilen, die mit der Raute beginnen, werden nicht ausgfeührt.

**>** ist das Eingabefeld für den Code. Achten Sie darauf, dass Sie den Code genauso eingeben, wie er angegeben ist.

**Pfeil nach oben** wiederholt den letzten Code-Befehl, indem er ihn in die aktuelle Zeile einfügt. Damit kann der Befehl ggf. verändert oder manipuliert werden.

Befehle werden mit **Enter** ausgeführt.

### Vorteile eines Kommandozeilen-basierten Programms wie R:
+ komplette Kontrolle über alle Befehle

+ Nachvollziehbarkeit der Befehlskette

+ leichteres Erkennen von Fehlern
### Nachteile eines Kommandozeile-basierten Programms wie R:
+ Einarbeitung notwendig

+ Befehle und Syntax müssen erlernt werden

## Installation von RStudio
Sämtliche Aufgaben rund um Ihr Netzwerkprojekt können theoretisch nur mithilfe von R durchgeführt werden. Wie jedoch schon erläutert wurde, besitzt R keine grafische Oberfläche, um Ihnen die Bedienung des Programms zu erleichtern.

Vergleichen Sie dies mit Ihrem Wissen aus der Vorlesung Web Development: Stellen Sie sich vor, Sie müssten Ihre Hausarbeiten in HTML-Dokumenten anstatt in Word schreiben. Statt ein Wort einfach mit einem einfachen Klick als Überschrift zu formatieren, müssten Sie es mühselig mit `<h1>Wort</h1>` markieren etc.

Ähnlich verhält es sich mit R und RStudio, der grafischen Oberfläche für R. Sie bietet eine einfachere Verwendung und Darstellung des Kommandozeilen-Programms und erleichtert Ihnen den Einstieg. Dabei verwendet RStudio das Programm R als Basis. Nur das Programm R zu öffnen, ist also während Ihres Projekts nicht nötig, aber selbstverständlich möglich, falls Sie die grafische Oberfläche nicht als Hilfe nutzen möchten.

### Installation
Da R die Basis der Oberfläche RStudio darstellt, muss R bereits installiert und auf seine Funktionstüchtigkeit getestet sein, bevor Sie RStudio installieren.

Die Installation ist ganz einfach. Gehen Sie auf [RStudio](https://www.rstudio.com/), wählen Sie "Products" und laden die kostenlose Desktop-Version für Ihr Betriebssystem herunter. Starten Sie das Programm wie gewohnt unter Programme per Doppelklick auf RStudio.

## Aufbau von RStudio
RStudio ist einfach aufgebaut und liefert viele individuell anpassbare Möglichkeiten. Wir bleiben hier bei der Standard-Ansicht:

![Standard-Ansicht](Link zum Bild)

Die Software ist in vier Fenster aufgeteilt, die wiederum eigene Reiter haben können. Die Reihenfolge der Fenster und der Reiter kann unter "View" geändert werden.

**Links unten** ist das wichtigste Fenster, die Konsole ("Console"). Sie entspricht der direkten Eingabe des Codes in R.

Das Fenster **links oben** zeit die Ergebnisse des Outputs an. Wenn ein Befehl bestimmte Daten liefert, sind diese dort sichtbar. Auch, wenn Sie ein Skript in RStudio laden, wird es in diesem Fenster angezeigt. Wenn Sie das Programm neu öffnen, es keinen Output gibt und auch kein Skript geladen wurde, ist das Fenster oben links zunächst leer. In diesem Fall wird Ihnen die Konsole vergrößert angezeigt.

**Rechts oben** ist die Arbeitsumgebung für R abgelegt. Dort geben Sie an, mit welchen Verzeichnissen Sie arbeiten.

**Rechts unten** ist ein Fenster mit mehreren wichtigen Reitern. **Files** sind die Dateien, mit denen Sie arbeiten, **Plots** sind Visualisierungen des Datensatzes und **Packages** sind Software-Pakete, die Sie installieren und de-installieren können.
