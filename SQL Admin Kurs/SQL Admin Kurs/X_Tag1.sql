/*

Installation

DB Dateien
Pfade f�r DB Dateien  mdf und ldf
-->trenne die beiden voneinander
--lege entsprechend Ordner an

Security
Auth-Art ...gemischte  bzw NT 
bei gemischter Auth --> SA (Vollzugriff) --komplexes Kennwort
und wer ist SQL Admin aus Windows Benutzer und Gruppen
--sa ppedv2019!  ..gemischte Auth

Dienstkonten

virtuelle Dienstkonten , die selbst Kennwort�nderungen organsieren
lokale Konten
bei RemoteZugriff muss das Recht f�r den Computer vergeben 
NT Service\....

..Dienste: Agent (Jobs), DB Engine, Browser (UDP Port 1434), Volltextsuche

InstanzFeatureauswahl und Funktion
DB Engine (Replikation, Volltextsuche)
Clientkonnektivit�t

MAXDOP TEMPDB ARBEITSSPEICHER
..schl�gt best practice vor
--> max Arbeitsspeicher ..man muss empfohlenen Wert aktiv �bernehmen






