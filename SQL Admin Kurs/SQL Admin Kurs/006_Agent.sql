--SQL Express ..hat keine Jobs 
--Agent


/*
per Zeitplan Jobs...

Job besteht us einzelnen Schritten

Auftr�ge  haben Zeitpl�ne


Agent Jobs k�nnen Nachrichten zusenden..
--per Mail
--per Pager

--Windows Protokoll

--Per Email.. dann muss der Agent per SMTP Mail versenden k�nnen..

--SMTP Server   Zugangsdaten Port 
--Profil merkt Zugangsdaten


--Windows SMTP Server ( = Features)



--Mailserver in SQL aktivieren

--> Datenbankemail einrichten

1. Verwaltung --> Datenbankemail
2. Profil mit Angabe der SMTP Settings

Profilart w�hlen:
Privates Profil 
.. ein direktes Recht auf das Profil

�fftl Profil
..dann muss ein User in der DB Rolle DatabaseMailUserRole sein
--k�nnte dann auch zuk�nftige Mailprofile verwenden

Systemparameter:
Tipp: Die Gr��e auf 10 MB festsetzen.. Dann gelingt es auch gr��ere Abfrageergebnisse oder Dateien sich 
zusenden zu lassen


--um eine Email zu bekommen am Ende eine Jobs..:


1: Operator

Andreas   andreasr@ppedv.de

--damit der Agent Email versendet:
1: Agent Warnugssystem: DB Email aktivieren und Profil zuweisen
2: Agent neu starten


*/


ufgesteuert) Zeitpl�ne Benachrichtigung 

md c:\Julian


--Warnungen


--User meldet Fehler

select * from ordersxy 
--Msg 208, Level 16, State 1, Line 14
--Ung�ltiger Objektname "ordersxy".

select  from orders
--Msg 156, Level 15, State 1, Line 18

select * from sysmessages where msglangid=1031

--Ebene!!!

--Ebene von 1 bis 10 sind reine Infos
--bis 16 DAU Fehler
--14 Security kein Zugriffsrechte

--ab 17 ..ab 23 geh aufs klo..du hast kollegen





