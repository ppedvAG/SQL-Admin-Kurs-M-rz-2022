---Was ist in Systemdatebanken?

--master (Logins, Datenbanken, Konfiguration)
--tempdb (#tabellen, Zeilenversionierung)
--msdb (Jobs..)

--Restore einer DB auf einen anderen Server... Verust von 
--Logins, Jobs, ..

--Lösung ContainedDB! ..leider nur teilweise oder eben gar nicht 

--man kann neben Users mit Login auch User mit Kennwort haben

USE [ContDB]
GO
CREATE USER [Julian] WITH PASSWORD=N'ppedv2019!'
GO


--Connect muss in Kombi mit DB gemacht werden

--Limits: Cross Abfragen, Replikation , CDC

--Teilweise??

--Login an DB
--#tab haben gleich Sprachsortierung wie UrsprungsDB


