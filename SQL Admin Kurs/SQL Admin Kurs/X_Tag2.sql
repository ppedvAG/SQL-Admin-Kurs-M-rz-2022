---Warum kann ich die Sicherung nicht restoren?
--Ich seh die Datei nicht:

--Dateiendung?? Evtl andere Endung?

--Richtiger Server? Explorer vs SQL Connection

--Wer macht den Restore?
--nie wird die angemeldete Person, auf die ext Ressourcen zugreifen
--es ist immer der Dienst? Zeitplan = Agent  ohne Zeitplan = SQL Server


--Kontrolle der Pfade!!

--Protokollfragment??

---Restore : 30sec   V D TTT
select 1600/30 ---53MB/Sec für Restore
 --2 Sec

 --V 
 select 1100/3 ---366MB/Sec

 --Woher kommt der Unterschied?
 --T Sicherug dauern  - bei viel Traffic - deutlich länger

 ----| Restore der Contained DB

 --Error: sp_configure --| = Servereinstellung
 zB
 EXEC sys.sp_configure N'min server memory (MB)', N'1'

 --oder auch EIgenständige Datenbank
RECONFIGURE WITH OVERRIDE
GO
EXEC sys.sp_configure N'contained database authentication', N'1'
GO
RECONFIGURE WITH OVERRIDE
GO






