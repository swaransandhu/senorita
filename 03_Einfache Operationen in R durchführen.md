# Einfache Operationen in R durchführen
In Lektion 3 lernen Sie die wichtigsten Basisoperationen für R kennen.

* Anzeigen von Daten
* Einfache Rechenoperationen durchführen
* R-Skripte einlesen

Bitte beachten Sie auch die Merkblätter für [RStudio (pdf)](https://e-learning.hdm-stuttgart.de/moodle/pluginfile.php/121402/course/section/19489/Basisoperationen%20R.pdf) und [Grundoperationen in R (pdf)](https://e-learning.hdm-stuttgart.de/moodle/pluginfile.php/121402/course/section/19489/Zusammenfassung%20Base%20R.pdf) (Achtung, die Blätter haben jeweils 2 Seiten).

## RStudio anpassen
RStudio lässt sich komplett vom Nutzer anpassen.

Ich empfehle Ihnen, als Minimalanpassung, die Konsole, die Arbeitsumgebung sowie Plots und Packages anzuzeigen.

Sie können die Anzeige unter RStudio > Preferences > Appearances (Mac) oder unter View > Panes > Pane Layout... anpassen.

![Pane Layout](/00_images/Pane.png)

Wie Sie RStudio anpassen, bleibt Ihnen überlassen. Die wichtigsten Funktionen sollten Sie jedoch anzeigen lassen und auch finden können.
## Arbeitsverzeichnis (working directory) definieren
R bezieht sich auf ein sogenanntes Working Directory, auf deutsch Arbeitsverzeichnis. Das bedeutet, dass alle Dateien, mit denen Sie arbeiten, in diesem Verzeichnis abgelegt sein müssen. Umgekehrt werden auch alle Dateien automatisch in diesem Verzeichnis abgelegt, die Sie bearbeiten und speichern.

Deshalb ist es ganz wichtig, dass Sie sich immer darüber im Klaren sind, in welchem Verzeichnis Sie sich gerade bewegen. Dies ist besonders wichtig, falls Sie gemeinsam in einem gemeinsamen Online-Ordner wie Dropbox oder OneDrive arbeiten. Der Pfad zum Arbeitsverzeichnis ist für jeden Benutzer individuell, da er von den jeweiligen Dateipfaden und Verzeichnissen des genutzten Laptops oder Computers abhängt.

Der Befehl, um Ihnen das derzeit eingestellte Working Directory anzeigen zu lassen, ist:

`> getwd() #gibt den Pfad zum aktuellen Working Directory aus`

Das "getwd" steht – wenig überraschend – für "get working directory". Die Ausgabe erhalten Sie mit einer [1], danach wird der Pfad angezeigt. In der Regel erhalten Sie hier den Pfad, in dem der Benutzer des Laptops angelegt ist. Das ist aber meistens nicht der Pfad, auf den Sie ihre Arbeitsdateien ablegen (wollen), besonders, wenn Sie mit mehreren in einer Dropbox arbeiten oder einfach ein anderes Verzeichnis oder sogar einen USB-Stick als Dateiablage nutzen wollen.

**Es gibt verschiedene Möglichkeiten, das Working Directory zu ändern. Je nachdem, welche Sie verwenden, ändert es sich nur temporär oder allgemein.**

### 1.Möglichkeit: Working Directory allgemein ändern
Bei dieser Möglichkeit bleibt Ihre Einstellung auch dann bestehen, wenn Sie RStudio schließen und wieder öffnen. Es findet demnach kein Reset Ihres Working Directorys statt.

Dafür wählen Sie unter Tools > Global Options > General > Default working directory > Browse Ihr gewünschtes Verzeichnis an und drücken auf Aplly und OK. Damit Ihr Working Directory eingestellt werden kann, müssen Sie RStudio schließen und neu öffnen. Ihr gewünschtes Verzeichnis ist nun dauerhaft als Working Directory eingestellt.
### 2.Möglichkeit: Working Directory temporär (z.B. für ein Projekt) ändern
Bei dieser Möglichkeit wird das Working Directory solange verändert, bis Sie RStudio schließen und wieder öffnen. In diesem Fall wird wieder die Default Einstellung aus Möglichkeit 1 genutzt. Um Ihre Arbeitsumgebung temporär zu ändern, rufen Sie im unteren rechten Fenster den Reiter "Files" auf. Sie sehen nun eine grafische Oberfläche der Datei- und Ordnerstruktur Ihres Nutzerordners.

![Datei- und Ordnerstruktur](/00_images/Ordner.png)

Wählen Sie nun den für Sie geeigneten Ordner für das Arbeitsverzeichnis aus und merken sich den Speicherort. Wenn Sie mit der Darstellung, die Ihnen RStudio ausgibt, nicht klar kommen oder Ihren gewünschten Ordner nicht direkt finden, können Sie auch auf das Symbol rechts mit den drei Punkten drücken. Dort können Sie Ihren Ordner in Ihrer gewohnten Ordnerstruktur suchen und auswählen. Wenn Sie in dem Ordner sind, den Sie für Ihr Projekt nutzen möchten, müssen Sie nur noch unter "more" die Funktion "set as working directory" auswählen. Damit wird der Ordner als Working Directory angelegt. Sie erhalten auch eine Bestätigung in der Konsole.

![Set as Working Directory](/00_images/wd.png)

Als Alternative können Sie das Working Directory einfach im Menü unter Session > Set Working Directory > Choose Directory... festlegen. Wie der Begriff "Session" schon andeutet, handelt es sich hierbei ebenfalls um eine temporäre Einstellung, die mit dem Beenden der Sitzung zurückgenommen wird.

### Neues Projekt
Wenn Sie unter File > New Project ein neues Projekt öffnen wollen, werden Sie ebenfalls darum gebeten, das Projekt entweder in einem neuen Arbeitsbereich anzusiedeln oder den gerade eingestellten zu verwenden.
## Einfache Operationen durchführen
Mit R lassen sich ganz schnell einfache Operationen durchführen. Die Grundlogik dafür ist einfach. Jeder Befehl hinterlässt ein Ergebnis, das mit einer [1] angezeigt wird. Beispielsweise können Sie direkt einfache Rechenoperationen auf der Kommandozeile durchführen:

Beispiel einer Addition

`> 2+7 #Beispiel einer einfachen Addition`

Sobald Sie mit Enter bestätigen, wird eine Ausgabe generiert. Dies gilt für alle Grundrechenarten und auch für komplexe mathematische Terme, ähnlich wie bei einem Taschenrechner.

`> 2/100*12 #komplexere Rechenoperationen

`> 2*(5+2-3)/3`

Neben diesen einfachen Operationen kann R auch komplexe statistische Verfahren abbilden. Dabei ist es wichtig, dass klar ist, wie der Syntax eines Befehls aussieht. Bei R ist der Syntax immer als Funktion eines Objekts mit einem Argument abgebildet, also:

`> funktion(objekt, argument) #Beispielsyntax in R`

Die Funktion legt fest, was mit dem Objekt (Zahl, Wert, etc.) passieren soll und das Argument präzisiert die Parameter der Funktion.

**Beispiel einer Funktion: Berechnung der Quadratwurzel des Wertes 100**

`> sqrt(100) #berechnet die Quadratwurzel aus 100, sqrt steht für square root`

Neben tatsächlichen Werten können Werte auch aggregiert (angehäuft) werden. Beispielsweise kann man den Mittelwert des Alters von fünf Studierenden, die in einer Reihe sitzen, berechnen. Dabei muss zunächst der Mengenbefehl c() für das Alter gebildet werden. Hier werden die Daten gemeinsam erfasst.

`> c(21,22,25,24,29) #Erstellung eines Vektors mit fünf verschiedenen Einträgen`

Jetzt soll das arithmetische Mittel, also der Mittelwert, des Alters der fünf Studierenden berechnet werden.

`> mean(c(21,22,25,24,29)) #Berechnung des arithmetischen Mittels der Einträge im Vektor`

Achten Sie darauf, dass hier eine Doppelklammer gesetzt wird, weil zwei Befehle verwendet werden, nämlich c() und mean().

Achtung: R gibt nicht jedes Mal ein Ergebnis aus (gerade wenn Funktionen eingesetzt werden), sondern geht davon aus, dass diese weiter eingesetzt werden.
### Objekte und Vektoren
Mit R können Sie über den Befehl "<-" auch komplexere Werte als **Objekt** verwenden. **Grundregel**: Mit dem Zuordnungsbefehl "Pfeil" "<-" weisen Sie Werte einem Objekt oder einer Variablen zu. In den neuen R Versionen wird dazu statt des Pfeils auch das Gleichheitszeichen "=" verwendet. Die Funktion ist identisch.

Beispielsweise sollten Sie das Ergebnis von 13 minus 3 als Variable sichern:

`> a <- 13-3 #Zuweisung einer Rechnung in eine Variable.`

Um herauszufinden, was "a" für einen Wert hat, geben Sie einfach "a" in die Konsole ein und drücken Enter. Der Wert der Variable a wird dann angezeigt.

`> a #Aufruf des Werts der Variable a`

Sie können jetzt Objekt a mit einem anderen Objekt koppeln, beispielsweise:

`> b <- a+5 # Zuweisung der Variable b in Abhängigkeit von a`

Um zu prüfen, welchen Wert "b" nun hat, muss wiederum nur b eingegeben werden.

`> b #Aufruf des Werts der Variable b`

Für numerische Variablen (also alle Zahlenwerte) lassen sich die Variablen mit allen Grundrechenarten und algorithmischen Befehlen weiterverwenden. Sollte die Variable allerdings einen Text-Wert beinhalten, dann wird nur der Text ausgegeben und keine weiteren Operationen sind möglich.

**Vektoren** fassen verschiedene Werte oder auch Objekte zusammen.

Wir wollen die Größe von fünf Studenten erfassen. Dazu verwenden wir zunächst den [c() Befehl](https://www.rdocumentation.org/packages/base/versions/3.4.3/topics/c), um R zu sagen, dass die folgenden Werte in cm als ein Vektor oder eine Liste verwendet werden sollen. Dann weisen wir dem Vektor einen Namen zu, nämlich "groesse".

`> groesse <- c(167, 189, 174, 182, 176) #Zuweisung der Variable groesse mit einem Vektor`

Gibt man nun "groesse" ein, erhält man als Ausgabe diese fünf Werte.

`> groesse # Aufruf des Werts der Variable groesse; damit Ausgabe der Werte des Vektors`

Mit dem Befehl [str](https://www.rdocumentation.org/packages/utils/versions/3.4.3/topics/str)(groesse) werden weitere Informationen bekannt gegeben, nämlich dass es sich um fünf numerische Werte handelt. str() steht für structure und liefert Details über die Werte.

`> str(groesse) # Ausgabe von Informationen über die Variable groesse (in diesem Fall ein Vektor)`

Erinnern Sie sich an die Mittelwertsberechnung? Wie müsste jetzt der Mittelwert für einen Vektor berechnet werden?

Richtig, Sie brauchen nur **mean (groesse)** eingeben, dann wird das Ergebnis automatisch für die numerische Folge von fünf Werten ausgerechnet, in diesem Fall 177,6 cm. Mehr zur Verwendung von [mean](https://www.rdocumentation.org/packages/base/versions/3.4.3/topics/mean)().

`> mean(groesse) # Mittelwertsberechnung der Variable groesse`

Mehr zu Vektoren gibt es in swirl, Kapitel 4.
### Aktive Werte anzeigen und löschen
Manchmal kann man den Überblick über die Werte verlieren, mit welchen gearbeitet wird. Mit der Funktion ls() lassen sich alle aktiven Werten im Arbeitsverzeichnis auflisten ("[list](https://www.rdocumentation.org/packages/base/versions/3.4.3/topics/ls)").

`> ls() # Auflistung aller aktiven Werte im Arbeitsverzeichnis`

Mit dem Befehl > rm(a) wird das Objekt in der Klammer aus dem Projektverlauf gelöscht ("[remove](https://stat.ethz.ch/R-manual/R-devel/library/base/html/rm.html)").

`> rm(a) # löscht das Objekt, das in der Klammer steht, in diesem Fall a. rm steht für remove.`

Die Werte und Variablen finden sich auch in RStudio im Fenster "Environment". Dort ist als zweiter Reiter auch die Funktion "History" angegeben, mit der Sie die einzelnen Schritte in R nachvollziehen können.
## Skripte einlesen, Editor und Konsole
Wir werden in diesem Tutorial viel mit vorbereiteten R-SKripten arbeiten. Das sind einfache Programme mit Erklärungen, die dann in R ausgeführt werden.

Deshalb trennen wir in RStudio die **Konsole** vom **Editor**. In der Regel schreiben wir den Code im Editor und führen die Befehle dann mithilfe der Konsole aus. Das Skript im Editor lässt sich so einfach speichern und zu einem späteren Zeitpunkt wieder verwenden. Beim Speichern muss u.U. „UTF-8“ ausgewählt werden.

Konsole | Editor
------ | -------
![Konsole](/00_images/konsole.png) | ![Editor](/00_images/editor2.png)
Konsole führt Zeile aus | Eingabe von Code/Laden von Skripten
Befehle können entweder direkt oder über den Editor eingegeben werden | Code-Zeilen werden durch den "run" Befehl gestartet
| Letzter Befehl wird durch CTRL/Command + Pfeil auf erneut aufgerufen.

### Neue Skripte in RStudio schreiben
Falls wir ein **neues Skript** im Editor schreiben möchten, wählen wir unter File > New File > R Skript. Das neue Skript öffnet sich im oberen linken Fenster, dem Editor. In diesem Fenster kann man das Skript ebenfalls speichern und benennen. Das Working Directory wird dabei automatisch als Speicherort gewählt. R Skripte haben die Dateiendung ".R".

Im Skript können wie gewohnt Code-Zeilen geschrieben werden. Dabei schreibt man die Befehle ohne das ">" Zeichen, das für gewöhnlich in der Konsole am Anfang der Zeile steht. Möchte man einen Befehl ausführen, so setzt man die Maus in die betroffene Zeile und klickt auf "Run". Der Befehl wird dann in der Konsole ausgeführt.

### Skripte in RStudio laden
Wenn man ein fremdes Skript oder ein davor gespeichertes Skript in RStudio laden möchte, muss dieses zunächst im Working Directory liegen. Skripte aus dem Internet müssen Sie daher immer in Ihrem Arbeitsverzeichnis abspeichern. Skripte, die Sie in RStudio schreiben, speichern Sie automatisch in das derzeit eingestellte Working Directory ab. Falls Sie einen anderen Pfad wählen möchten, ist dies im Speicherfenster natürlich auch möglich.

Wenn Sie ein Skript laden möchten, können Sie dies unter File > Open File tun. Dabei öffnet sich automatisch Ihr Working Directory. Sie können ebenfalls im unteren rechten Fenster in RStudio im Reiter Files unter More "Go to Working Directory" wählen und Ihr dort gespeichertes Skript anklicken. Das Skript wird automatisch in das obere linke Fenster geladen und kann bearbeitet werden.

Im oberen linken Fenster können Sie mehrere Skripte gleichzeitig offen haben. Per Mausklick können Sie zwischen den Tabs wechseln und sie bearbeiten. Jedes geöffnete Skript muss jedoch einzeln abgespeichert werden, damit keine Daten verloren gehen.

**Aufgabe**: Laden Sie das Beispiel-Skript herunter ([Skript Karate](https://e-learning.hdm-stuttgart.de/moodle/pluginfile.php/121435/mod_book/chapter/226/226305%20R%20Skript%20igraphdata%20karate%20laden.r)). Sichern Sie das Skript in Ihrem Working Directory. Öffnen Sie das Skript wie oben beschrieben. Das Skript sollte nun im Editor auftauchen. Führen Sie das Skript zeilenweise aus. Ändern Sie Parameter im Editor und sichern Sie das Skript unter einem neuen Namen in Ihrem Working Directory.
