/*
BACKUP

Unfälle

1. Ganzer Server tot
2. Logische Fehler (falsche Daten oder fehlende Daten)
3. Server tot , aber HDD ok
4. Wenn ich weiss, das was gleich was passieren kann...


Welche Backups kann man denn machen?

Vollständige Sicherung  V
Diff Sicherung				  D
Transaktionsprot.			  T


V:
komplette DB zu einem best Zeitpunkt
Checkpoint
Sicherung der MDF und LDF

D
Diff zu dem letzten V (Zeitpunkt)


T
sichert den Weg der Datenänderungen 
auf Sekunden Restore
dh jeder INS UP DEL wird nachgemacht




x V 8:00
	T
	T
	T
		D 9:00
	T
	T
	T
x		D 10:00
x	T
x	T
x	T 10:45

V D TTT

--was ist demnach der schnellste Restore?
--V --- so oft wie möglich

--Wie lange dauert der Restore eine T?
--so lange, wie die Aktionen selbst dauerten maximal die Zeitdiff zwischen den Ts


--Das D verkürzt den Restore und sichert ihn?
--


















*/