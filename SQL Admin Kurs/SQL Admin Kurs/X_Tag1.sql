/*

Installation

DB Dateien
Pfade für DB Dateien  mdf und ldf
-->trenne die beiden voneinander
--lege entsprechend Ordner an

Security
Auth-Art ...gemischte  bzw NT 
bei gemischter Auth --> SA (Vollzugriff) --komplexes Kennwort
und wer ist SQL Admin aus Windows Benutzer und Gruppen
--sa ppedv2019!  ..gemischte Auth

Dienstkonten

virtuelle Dienstkonten , die selbst Kennwortänderungen organsieren
lokale Konten
bei RemoteZugriff muss das Recht für den Computer vergeben 
NT Service\....

..Dienste: Agent (Jobs), DB Engine, Browser (UDP Port 1434), Volltextsuche

InstanzFeatureauswahl und Funktion
DB Engine (Replikation, Volltextsuche)
Clientkonnektivität

MAXDOP TEMPDB ARBEITSSPEICHER
..schlägt best practice vor
--> max Arbeitsspeicher ..man muss empfohlenen Wert aktiv übernehmen






