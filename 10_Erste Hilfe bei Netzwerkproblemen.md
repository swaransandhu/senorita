# Erste Hilfe bei Netzwerkproblemen
Es klappt nicht so, wie es sollte? Dann wird es Zeit für den Werkzeugkasten Netzwerkanalyse

Bitte lesen Sie die typischen Fragen aufmerksam durch. Sie beantworten 90% von allen Schwierigkeiten bei der Netzwerkanalyse.

## Hilfe – es läuft nicht so, wie geplant!
In den meisten Fällen lässt sich der Grund bei sorgfältiger Analyse finden. Es ist allerdings unabdingbar, dass Sie im Team gut zusammenarbeiten und Ihr Datensatz sauber erhoben ist. Deshalb gibt es hier viele Beispiele und Hinweise. Wenn Sie sich daran halten, sollte es auch mit dem Projekt klappen.

## Prüfen der Formatierung
Die Problemlagen sind meist ähnlich gelagert:

* Die Forschungsfrage ist unklar bzw. nicht definiert
* Probleme mit dem Datenzugang: Daten lassen sich nicht erheben.
* Unklares Verständnis der Datenerfassung und/oder -bereinigung.
* Datensatz ist fehlerhaft und kann nicht weiter bearbeitet werden.

In vielen Fällen, aber nicht immer, bedeutet dies: zurück auf Start.

1. Unklare Forschungsfrage

Je genauer ihr Netzwerk definiert ist (klare Abgrenzung, etc.) und je klarer die Forschungsfrage (Was wollen wir herausfinden? Wie?), desto besser können Sie die Datenerfassung vorbereiten.

2. Datenzugang schwierig

Je nach Forschungsfrage ist der Datenzugang unterschiedlich gelagert. Er reicht von persönlichen Erhebungen/Befragungen über die Auswertung von öffentlich zugänglichem Material (Dokumente), den Zugang zu Online-Datenbanken oder Programmierschnittstellen. Prinzipiell gilt: je einfacher der Zugang, desto besser. Dazu gehören Datenbanken, Mitgliederstatistiken oder ähnliches. Allerdings sind diese Daten häufig nicht relational, d.h. es müssen zusätzliche Beziehungsdaten erhoben werden.

3. Unklares Verständnis bei der Datenerfassung

Generell sollten alle Daten sauber erhoben sein, damit sie gut weiterverwendet werden können. Typische Fehler können auftreten, wenn Edge- und Nodelist nicht sauber getrennt sind oder wenn unklar ist, welche Zwecke die Formate erfüllen.

Zur Erinnerung:

Die **Edgelist** ist ein Format, um Beziehungen abzubilden. Die **Nodelist** hingegen dient der genaueren Beschreibung der Knoten (Nodes) in einem Netzwerk. Im Einzelfall reicht eine Edgelist, um ein Netzwerk abzubilden. Für detailliertere Analysen ist eine Nodelist unabdingbar. Jede Erhebung benötigt eine Beschreibung der **Codierung**.

**Edgelist** als Tabelle: sender | empfaenger | gewicht | ...

Achtung: Eindeutige Bezeichnungen für die ersten beiden Spalten verwenden. Das bezieht sich auf die Beziehungsstärke zwischen den Knoten und muss operationalisiert sein, wenn es verwendet wird. D.h. in der Regel verwendet man für das Gewicht eine Skala von 1 bis 3, 1-5 oder manchmal 1-X, das ist abhängig von der Forschungsfrage. Wichtig ist, dass der höhere Wert eine stärkere Beziehungsintensität beschreibt. In der Edgelist können weitere Beziehungsattribute gespeichert werden, diese beziehen sich aber nur auf die Art der Beziehung.

**Nodelist** als Tabelle: ID | label | type | ...

Die Nodelist ist das Gegenstück zur Edgelist. Hier müssen alle Knoten, die in der Edgelist erwähnt wurden (egal, ob Sender- oder Empfänger-Spalte) mit genau der gleichen Bezeichnung erfasst werden. Sonst kann keine Matrix berechnet werden. Da die Edgelist manchmal mit Abkürzungen arbeitet, ist es sinnvoll, als zweite Spalte „label“ einzuführen. Das ist die Bezeichnung, mit der die Knoten in der Visualisierung dargestellt werden. Ebenfalls nicht zwingend, aber hilfreich, ist die Kategorie „type“. Dies ist für two-mode-Netzwerke unabdingbar, damit die Unterscheidung zwischen Akteur (z.B. Person) und Mitgliedschaft/Teilnahme (z.B. Event, Organisation, etc.) klar ist. In der Regel erhält die Mitgliedschaftskategorie einen höheren numerischen Wert, am einfachsten ist es, die Werte 0 für Akteure wie Personen oder Organisationen und 1 für Mitgliedschaft/Teilnahme/Zugehörigkeit zu verwenden. Weitere Knoten-Attribute können z.B. akteursbezogene Eigenschaften wie etwa demographische Daten (etwa Geschlecht, Alter, Bildungsgrad, Einkommen, etc.) sein oder spezifische Auskünfte über den Knoten.

Achtung: für die erste Zeile der Tabelle immer nur eine eindeutige Bezeichnung verwenden. Bitte achten Sie darauf, welche Art von Daten dargestellt werden sollen: **Nominale** Daten haben eine klare, häufig dichotome Unterscheidung (Geschlecht = männlich oder weiblich, operationalisiert durch Textfeld „male“ oder „female“ oder codiert als „1“ (female) oder „2“ (male)). **Ordinale** Skalen erfassen eine Einschätzung auf einer Skala ("sehr stark, stark, mittel, schwach, sehr schwach"), die häufig einer natürlichen Ordnung oder Interpretation entsprechen (etwa die Beziehungsstärke in der Edgelist). Schließlich sind **metrische/rationale** Daten in der Regel numerisch und haben einen klaren Nullpunkt (z.B. Einkommen, Geschwindigkeit, Reichweite, etc.). Teilweise ist es einfacher, bereits nach der Datenerhebung die metrische Skala in eine Ordinalskala umzuschreiben, damit die Abgrenzung deutlicher wird. Das muss allerdings sauber begründet sein. Ansonsten lassen sich auch in der weiteren Auswertung bestimmte Datenbereiche erfassen. Schneller geht es allerdings, wenn die Unterteilung bereits bei der Erfassung passiert.

## Typische Probleme und Fragen
Hier finden Sie typische Probleme und Lösungsansätze.

### Datensatz kann nicht gelesen werden
Wir verwenden ausschließlich Dateien im CSV-Format, das ist ein Standard-Tabellenformat für große Datenmengen. Allerdings eignet sich *Microsoft-Office* nicht gut, um das Format richtig zu speichern.

Prüfen Sie deshalb folgende Punkte:

1. Ist der Header (erste Zeile der Tabelle) sauber beschriftet?
2. Hat jede Spalte nur ein Wort als Bezeichnung und dies ohne Sonderzeichen?
3. Ist die Datei gemäß den Vorgaben erstellt?
4. Sind die „IDs“, d.h. die eindeutige Zuordnung der Knoten, in der Edgelist genau gleich wie in der Nodelist? Dies bedeutet dass die Bezeichnungen in beiden Spalten der Edgelist, d.h. alle je genannten Akteure, ihre genaue Entsprechung in der Nodelist haben müssen. Dabei spielt die Häufigkeit der Nennung in der Edgelist keine Rolle.
5. Ist jede ID sorgfältig und fehlerfrei geschrieben und stimmt überein?
6. Ist das Dateiformat tatsächlich als CSV-Datei gespeichert und wird das Komma („,“) als Trennzeichen zwischen den Spalten verwendet? Die Datei darf keine Sonderzeichen oder zusätzliche Formatierungen enthalten.
7. Ist das Working Directory richtig gesetzt bzw. liegt die zu importierende Datei in der Working Directory?

### Doppelte Knoten, Überprüfung der Datenerfassung
Wenn in einer Visualisierung Knoten doppelt vorkommen, liegt dies in der Regel an einer Schreibweise, die zwar identisch aussieht, aber nicht identisch ist. Meist fehlt ein Leerzeichen oder es ist ein Leerzeichen zu viel im Namen.

Vorgehen:

1. Prüfen einer exemplarischen Visualisierung der Edgelist in z.B. *Palladio* (einfacher Datenimport).
2. Fällt auf, dass Knoten doppelt erscheinen?
3. Prüfen der Edgelist auf die Schreibweise der Knoten: Datei neu speichern. Die ersten beiden Tabellenspalten untereinander in eine Spalte kopieren. Alphabetisch sortieren. Manuelles oder automatisches Prüfen der Datenkonsistenz.
4. Abgleich der Edgelist mit der Nodelist: Aus dem korrigierten Datensatz Dubletten entfernen. Nodelist duplizieren. Leere Spalte links von der Nodelist ID einfügen. In diese Spalte die korrigierte zusammengefasste Spalte der Edges (also mit allen Sendern und Empfängern in einer Spalte) kopieren und mit der Spalte der Node IDs abgleichen.

### R liest die CSV Datei nicht
Das Einlesen der CSV-Datei misslingt. Hier kann es verschiedene Gründe geben:

1. Ist die Datei korrekt im Working Directory abgespeichert?
2. Liegt die Datei im korrekten CSV-Format vor?
3. Sind die Inhalte der Tabellenspalten korrekt formatiert (Text vs. Zahlen)?
4. Stimmt die Anzahl der Edges mit derjenigen der Node-IDs überein?

Achtung: *R* ist kontextintensiv, d.h. auch Tippfehler werden bestraft.

### R liest die Datei teilweise, kein igraph Objekt
Es wird nur ein Teil der Daten eingelesen, eine Kombination der Edge- und Nodelist funktioniert nicht.

## Zusätzliche Programme
Wir arbeiten mit *R*, aber manchmal sind zusätzliche Programme ebenfalls hilfreich.

### Open Office

### SocNetV (Social Network Visualizer)

### Texteditor (Atom)

### Visone

### Gephi

## Hilfestellungen im Netz
Teilweise finden Sie die Antwort auf einschlägige Fragen auch in Foren oder der Hilfefunktion der einzelnen Programmpakete von *R*.
