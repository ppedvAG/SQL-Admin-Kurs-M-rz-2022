--Mailkonto:  smtp Konto

--Servermanager: 
--Feature SMTP Server
--Server: hv-sql2										hv-sql1
---> Internetinformationsdienste Manager 6.0

--Agent


/*
per Zeitplan Jobs...

Job besteht us einzelnen Schritten

Aufträge  haben Zeitpläne


Agent Jobs können Nachrichten zusenden..
--per Mail
--per Pager

--Windows Protokoll

--Per Email.. dann muss der Agent per SMTP Mail versenden können..

--SMTP Server   Zugangsdaten Port 
--Profil merkt Zugangsdaten


--Windows SMTP Server ( = Features)



--Mailserver in SQL aktivieren

--> Datenbankemail einrichten

1. Verwaltung --> Datenbankemail
2. Profil mit Angabe der SMTP Settings

Profilart wählen:
Privates Profil 
.. ein direktes Recht auf das Profil

Öfftl Profil
..dann muss ein User in der DB Rolle DatabaseMailUserRole sein
--könnte dann auch zukünftige Mailprofile verwenden

Systemparameter:
Tipp: Die Größe auf 10 MB festsetzen.. Dann gelingt es auch größere Abfrageergebnisse oder Dateien sich 
zusenden zu lassen


--um eine Email zu bekommen am Ende eine Jobs..:


1: Operator

Andreas   andreasr@ppedv.de

--damit der Agent Email versendet:
1: Agent Warnugssystem: DB Email aktivieren und Profil zuweisen
2: Agent neu starten


*/


