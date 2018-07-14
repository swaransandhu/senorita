# GitHub Anleitung
Hier lernen Sie, wie man *GitHub* verwendet, um gemeinsam am Netzwerkprojekt arbeiten zu können.

*GitHub* ist ein Tool, mit dem mehrere Personen ganz einfach an einem Programmier-Projekt arbeiten können. Dabei gibt es nicht mehrere Dateien, die mühsam an alle verschickt werden müssen, sondern einen Arbeitsbereich, auf den alle zugreifen und den alle bearbeiten können. In dieser Lektion lernen Sie, wie man *GitHub* verwendet.

## GitHub-Basics
*GitHub* ist eine Versionsverwaltung für Software-Projekte. Das bedeutet, dass *GitHub* die Versionen eines oder mehrerer Dokumente koordiniert und ordnet, damit man den Überblick über den Fortschritt des Projekts behält. Denn wer kennt es nicht: Kaum arbeitet man in einer Gruppe, gibt es zahlreiche Dokumente mit den Endungen „.final“, „.final2“ oder „.absolutfinal“ und jeder ist auf einem anderen Stand.

*GitHub* schafft Ihnen einen einzigen Arbeitsbereich, auf den jeder Zugriff hat und kontrollieren kann, wann welche Änderungen getätigt werden. Sie haben all Ihre Dateien auf einer Stelle und können sogar Ihre Node- und Edgelists direkt aus *GitHub* auslesen.

### Repository erstellen
Zunächst müssen Sie sich auf [*GitHub*](www.github.com) registrieren. Wählen Sie am besten einen Nutzernamen ohne Umlaute.

In Ihrer Gruppe muss nur eine Person das Repository gründen. Ein Repository ist ein Arbeitsbereich, in den Sie Ihre Dateien laden, bearbeiten und sich austauschen. Kurzum: Das Repository ist Ihr Projekt. Die Person, die es gründet, ist zeitgleich Admin und hat damit die meisten Rechte. Es sollte also jemand sein, der mit *GitHub* umgehen kann.

#### Repository gründen
Gehen Sie oben rechts auf *GitHub* auf das kleine Plus-Zeichen und klicken Sie auf New Repository. 

![New Repository](/00_images/NewRepo.png)

Im sich öffnenden Fenster wählen Sie Ihren Account als Owner aus und benennen das Repository sinnvoll, zum Beispiel als „Netzwerkprojekt“ oder „Karate_Club“. Der Name muss nicht einzigartig gewählt werden, sondern sollte lieber gut im Gedächtnis bleiben. Auf Umlaute sollten Sie auch hier jedoch verzichten. In der Description müssen Sie nichts angeben. Wenn Sie wollen, können Sie hier Ihr Projekt aber kurz beschreiben. Wenn Sie kein Bezahl-Abo abschließen wollen, muss Ihr Repository auf öffentlich bleiben. Das bedeutet aber auch, dass jeder Ihr Projekt einsehen kann. Das ist nicht schlimm, immerhin bearbeiten Sie hier hauptsächlich nur Skripte. Bedenken Sie dennoch, keine privaten Informationen über sich ins Repository zu stellen.

Setzen Sie den Haken beim Punkt „Initialize...“ und lassen Sie die anderen Schaltflächen auf None/None. Drücken Sie auf Create Repository und Sie befinden sich in Ihrem eigenen Projekt. Was Sie dort alles machen können, wird im nächsten Kapitel erklärt.

![Repository gründen](/00_images/RepoGruenden.png)

### Erste Schritte
Bevor Sie loslegen können, gibt es noch ein paar Dinge zu tun.

#### Mitglieder einladen
Bisher sind Sie als Admin allein in Ihrem Repository. Unter Settings > Collaborators können Sie Ihre Gruppenmitglieder einladen. Dafür müssen Sie schlicht deren *GitHub*-Usernamen eingeben und einen Einladungslink verschicken, den die Mitglieder in ihrem E-Mail-Posteingang bestätigen müssen.

#### Projekt einrichten
Dieser Schritt ist nicht zwingend notwendig, aber durchaus nützlich. Im Reiter „Projects“ können Sie als Admin ein Projekt erstellen. Dieses können Sie einfach gleich wie das Repository benennen. Unter „Template“ können Sie mit der Auswahl „Kanban Basic“ eine interne To-Do-Liste erstellen, die wie beim Online-Anbieter *Trello* gestaltet ist. Wenn Sie das Projekt mit diesem Template erstellt haben, können Sie Aufgaben notieren und als bewegliche Kästchen zwischen den Kategorien „To-Do“, „In Progress“ und „Done“ hin- und herschieben. Diese Kategorien können Sie nach Wunsch beliebig anpassen. Jedes Gruppenmitglied kann das Projekt einsehen und die Aufgaben bearbeiten.

## GitHub Nutzung
Das Repository ist angelegt, Ihre Gruppenmitglieder sind eingeladen und gegebenenfalls haben Sie sogar ein Projekt angelegt, in dem Sie Ihre To-Dos organisieren können. Jetzt können Sie damit beginnen, Ihr Netzwerkprojekt in *GitHub* zu bearbeiten. Wie Sie *GitHub* dafür am besten nutzen können, wird in den folgenden Kapiteln schrittweise erklärt.

### Textformen
Auf *GitHub* können Sie über „Create New File“ Dateien erstellen. Klicken Sie auf die Schaltfläche, öffnet sich ein Editor, bei dem zwischen der Edit- und der Preview-Ansicht hin und her schalten können. Zudem können Sie die Datei benennen.

#### Skript-Dateien
Nennen Sie Ihre Datei „Versuch1“ und schreiben Sie ein paar Zeile in den Editor. Wenn Sie nun in die Preview wechseln, sehen Sie, dass Ihnen Ihre Eingabe als Code wiedergegeben wird. Das heißt, dass Sie Ihr *R*-Skript, welches Sie in *RStudio* entwickeln, in eine solche Datei kopieren und auf *GitHub* in Ihr Repository abspeichern können.

#### Markdown-Dateien
Nennen Sie Ihre Datei nun in „Versuch1.md“ um, schreiben Sie wieder ein paar Zeilen in den Editor und wechseln in die Voransicht. Wie Sie sehen, wird Ihnen der Text nun formatiert angezeigt. Das liegt daran, dass Sie mit der Endung „.md“ eine Markdown-Datei angelegt haben. Mithilfe von Markdown können Sie Ihre Eingabe ähnlich wie bei HTML formatieren. Eine sehr gute und einfache Anleitung zu Markdown finden Sie [hier](https://guides.github.com/features/mastering-markdown/). Markdown-Dateien können Sie nutzen, um Anleitungen zu schreiben oder Auskunft zu Ihrem Projekt zu geben. Dafür gibt es ja die bereits automatisch angelegte README-Datei, die ebenfalls als Markdown-Datei angelegt ist.

### Bearbeitung von Dateien
Wenn Sie Ihr Netzwerkprojekt mithilfe von *GitHub* koordinieren möchten, sollten Sie das Skript, das Sie in *RStudio* angefangen haben, zu entwickeln, als Skript-Datei in Ihrem Repository anlegen. Dafür gehen Sie auf „Create New File“, kopieren die Zeilen Ihres *R*-Skripts in den Editor auf *GitHub*, benennen die Datei und klicken unten auf „Commit new file“. „Commit directly to the master branch“ muss ausgewählt sein. Der master branch (Hauptzweig) ist Ihr Repository. Die branch-Schaltfläche, die in der Ansicht des Repositorys (Reiter „<> Code“) zu sehen ist, steht für gewöhnlich auch auf „master“.Dieses erste Einstellen Ihres Skripts auf *GitHub* kann nur der Admin vornehmen.

Jede weitere Veränderung, die Sie am Skript vornehmen (zum Beispiel weil Sie ein neues Teilnetzwerk erstellen wollen), möchten Sie natürlich nicht nur lokal auf Ihrem Laptop haben, sondern über *GitHub* mit Ihren Kommilitonen teilen. Dafür müssen Sie die Skript-Datei auf *GitHub* bearbeiten. Klicken Sie dafür in Ihrem Repository auf die Datei und dann auf den kleinen Bearbeitungs-Stift. Die Editor-Ansicht öffnet sich erneut.

#### Für den Admin
Der Admin kann die Änderungen direkt in das Skript schreiben und unten über „Commit changes“ zum master branch hinzufügen. In der Folge wird das Skript direkt überschrieben. Im Repository findet sich im master branch also nur noch die überarbeitete, neue Version des Skripts.

#### Für die Collaborators
Collaborators haben im Gegensatz zum Admin keinen direkten Schreibzugriff. Wenn Sie Änderungen an der Skript-Datei vornehmen möchten, haben Sie zwei Möglichkeiten.

1. Neuen Zweig gründen, dann bearbeiten

In der Ansicht des Repositorys können Sie auf die Schaltfläche „Branch: master“ klicken, eine klare Bezeichnung in die Schaltfläche eingeben (z.B. „NeuesTeilnetzwerkAnna“) und „Create branch...“ auswählen. Mithilfe der Schaltfläche können Sie nun zwischen den branches „master“ und „NeuesTeilnetzwerkAnna“ wechseln. „master“ ist sozusagen das Original,  „NeuesTeilnetzwerkAnna“ eine Kopie, in der sie sich als Collaborator austoben können. Wenn Sie in Ihrem branch sind und das Skript auswählen, können Sie es bearbeiten. Ihre Änderungen werden mit dem „Commit change“-Button jedoch in Ihren branch geschrieben und nicht in den master branch. Das bedeutet, dass der master branch unverändert bleibt und Ihre Änderungen nur in Ihrem branch angezeigt werden.

Wenn Sie sich Ihrer Änderungen sicher sind und möchten, dass auch das Skript im master branch Ihre Änderungen enthält, müssen Sie im Repository unter dem Reiter „Pull Request“ einen solchen starten. Ein Pull Request ist sozusagen die Bitte von einem branch an den anderen, sich zu vereinen. Dabei schaut *GitHub*, wo sich die Dateien unterscheiden und ergänzt beziehungsweise reduziert den base branch um die Änderungen des compare branches. Bei diesem Pull Request müsste man als base also master, als compare NeuesTeilnetzwerkAnna auswählen. Klicken Sie auf „Create Pull Request“. Im nächsten Schritt können Sie auch noch einen Kommentar anfügen, müssen das aber nicht tun. Klicken Sie wieder auf „Create Pull Request“. Damit ist Ihr Pull Request gemacht. Nur der Admin kann die zwei branches vereinen, also „mergen“. Ihm kommt deswegen eine erhöhte Verantwortung zu, da er die Änderungen prüfen und akzeptieren muss. Nach dem merge kann er Ihren branch schließen, übrig bleibt der master branch mit Ihren Neuerungen.

2. Bei der Bearbeitung Zweig gründen

Die zweite Möglichkeit unterscheidet sich nur minimal vom oben Erklärten. Hierbei erstellen Sie nicht zuerst in der Repository-Ansicht einen neuen Zweig, sondern klicken als Collaborator im master branch auf die zu bearbeitenden Datei und nehmen Ihre Änderungen vor. Unten können Sie Ihre Änderungen dem Admin vorschlagen oder für die Änderung einen neuen Zweig erstellen. In beiden Fällen ist die direkte Änderung des master branches als Collaborator jedoch verwehrt.

### CSV-Dateien
*GitHub* ist besonders übersichtlich, da Sie nicht nur gemeinsam das Skript bearbeiten können, sondern auch Ihre CSV-Dateien hier hochladen können. Dafür muss der Admin lediglich im master branch auf „Upload Files“ klicken und die CSV-Dateien, also die Edge- und Nodelists per Drag&Drop ins Repository ziehen. Auch das Codebuch kann hier abgespeichert und aktualisiert werden. Dass die CSV-Dateien im Repository liegen, hat einen entscheidenden Vorteil: *RStudio* kann CSV-Dateien direkt aus *GitHub* auslesen. Dafür müssen Sie folgende Code-Zeilen in Ihr *R*-Skript schreiben:

`> el <- read.csv("URLEdgelist", header=T, as.is=T, sep=",") # liest Edgelist aus *GitHub* aus und weist sie einer Variablen zu`

`> nl <- read.csv("URLNodelist", header=T, as.is=T, sep=",") # liest Nodelist aus *GitHub* aus und weist sie einer Variablen zu`

Die richtige URL erhalten Sie, indem Sie auf die Edge- oder Nodelist im Repository klicken und auf den Button „Raw“ klicken. Die Listen öffnen sich daraufhin im Browser als Rohformat. Die URL aus der Adresszeile ist die richtige URL für den *R*-Befehl „read.csv“.
