--SQL Express ..hat keine Jobs 
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


ufgesteuert) Zeitpläne Benachrichtigung 

md c:\Julian


--Warnungen


--User meldet Fehler

select * from ordersxy 
--Msg 208, Level 16, State 1, Line 14
--Ungültiger Objektname "ordersxy".

select  from orders
--Msg 156, Level 15, State 1, Line 18

select * from sysmessages where msglangid=1031

--Ebene!!!

--Ebene von 1 bis 10 sind reine Infos
--bis 16 DAU Fehler
--14 Security kein Zugriffsrechte

--ab 17 ..ab 23 geh aufs klo..du hast kollegen





