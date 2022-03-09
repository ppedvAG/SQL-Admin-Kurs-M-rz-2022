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


--Wiederherstellungsmodel

	Wiederherstellungsmodel (Tlog!!!)

	Einfach (schnell-weniger genau restoren)
	IUP gespeichert, aber dann etwas später automatisch gelöscht
	Bulk Oerationen werden rudimentär gespeichert
	--> keine Sicherung des Logfile
	--oft bei TestServer

	Massenprotkolliert  (Kompromiß)
		--wie einfach, aber nichts gelöscht
		--> Logfile muss gesichert werden, sonst wird das Logfile nicht mehr geleert
		--nur die LogSicherung leert das Logfile
		--man kann nur dann auf Sek restoren, wenn kein Bulk auftrat
	--Logshipping verlangt mind dieses Model

	Vollständig (langsamer aber sicherer)
--wie einfach, aber Bulk Operation sehr detailiert und auch andere Dinge wie IX werden auch protokolliert
--> Restore auf Sekunde
--> Logfile wächst stärker
--ProduktivDB
--Hochverfügbarkeitslösungen verlangen dieses Model : Spiegeln, Hochverfügbarkeitsgruppen





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

--Wiederherstellungsmodell
--regelt den Inhalt des Tlog


USE [master]
GO
ALTER DATABASE [Northwind] SET RECOVERY FULL  WITH NO_WAIT
GO

----------------------------------------------
TX! TX! TX! TX!  
----------------------------------------------

--BAK TX TX TX 

Einfach:
TX die commited werden autom gelöscht
--keine Sicherung des Logfiles
--es wird INS UP DEL BULK (sehr einfach) protokolliert
--TESTDBS


--Massenprotokolliert
--es wird INS UP DEL BULK (sehr einfach) protokolliert
--es wid nichts gelöscht
--nur die Sicherung des TLog leert das Logfile ..dafür wandern die TX in das Backup


--Vollständig
--es wird INS UP DEL BULK (detailiert) protokolliert
--restore auf Sek möglich
--Sicherung! da Log deutlich schneller wächst


--jederzeit läßt sich das Model ändern!


*/


--FULL
BACKUP DATABASE [Northwind] TO  DISK = N'D:\_BACKUP\Northwind.bak' WITH  RETAINDAYS = 14, NOFORMAT, NOINIT, 
NAME = N'Nwind Full', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--DIFF
BACKUP DATABASE [Northwind] TO  DISK = N'D:\_BACKUP\Northwind.bak' WITH  DIFFERENTIAL ,  RETAINDAYS = 14, NOFORMAT, NOINIT,  
NAME = N'Nwind Diff', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--TLOG
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northwind.bak' WITH  RETAINDAYS = 14, NOFORMAT, NOINIT,  
NAME = N'Nwind Tlog', SKIP, NOREWIND, NOUNLOAD,  STATS = 10
GO


--V TTT D TTT D TTT D TTT


--RESTORE

--FALL1 Server tot.. Backup lebt



--Fall2: Versehentlich Daten manipuliert (INS UP DEL)

--Backup Restore von 8 Uhr.. sind Daten weg

Restore unter anderen Namen
PFade bwz DAteinamen anpassen..
Protkollfragement ausschalten


--Fall3 : DB tats restore
--Orig DB ist nohc aktiv und ok.. aber verdrehte Daten , aber unmöglich genau herauszufinden , was alles verdreht wurde
--mit geringst möglichen Datenverlust

V D
T 11:30
! 12:06 Error -- Restore von 12:05
T 12:30


--Was tun.... V D letzte T (11:30) 35 min Datenverlust

--warum warten: jetz eine T Sicherung um 12:12--> Restore von 12:05
Datenverlust wäre der Zeitaum von 12:12 bis Ende der T Sicherung,  zb das T dauert 5 min.. Backups sind Online


--besser so: user müssen zum Zeitpunkt des Backups von der DB weg bleiben
---               T Sicherung um 12:12


*/

USE [master]
ALTER DATABASE [Northwind] SET SINGLE_USER WITH ROLLBACK IMMEDIATE
BACKUP LOG [Northwind] TO  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-03-08_12-19-16.bak' WITH NOFORMAT, NOINIT,  NAME = N'Northwind_LogBackup_2022-03-08_12-19-16', NOSKIP, NOREWIND, NOUNLOAD,  NORECOVERY ,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 1,  NORECOVERY,  NOUNLOAD,  REPLACE,  STATS = 5
RESTORE DATABASE [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 9,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 10,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 11,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 12,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind.bak' WITH  FILE = 13,  NORECOVERY,  NOUNLOAD,  STATS = 5
RESTORE LOG [Northwind] FROM  DISK = N'D:\_BACKUP\Northwind_LogBackup_2022-03-08_12-19-16.bak' WITH  NOUNLOAD,  STATS = 5,  STOPAT = N'2022-03-08T12:07:34'
ALTER DATABASE [Northwind] SET MULTI_USER

GO


SNAPSHOT

*/


-- =============================================
-- Create Database Snapshot Template
-- =============================================
USE master
GO



-- Create the database snapshot
CREATE DATABASE <Database_Name, sysname, Database_Name>_<Snapshot_Id,,Snapshot_ID> ON
( NAME = <Database_Name, sysname, Database_Name>, FILENAME = 
'C:\Program Files\Microsoft SQL Server\MSSQL15.MSSQLSERVER\MSSQL\Data\<Database_Name, sysname, Database_Name>_<Snapshot_Id,,Snapshot_ID>.ss' )
AS SNAPSHOT OF <Database_Name, sysname, Database_Name>;
GO


CREATE DATABASE SNDBNAME ON
(
NAME=OrigLogNameDatenDatei,
FILENAME=' Pfad und Datei des snapshot'
)
as SNAPSHOT OF OrigDB


create database sn_nwind_1416 on
(
NAME=Northwind,
FILENAME='D:\_SQLDB\sn_nwind1416.mdf'
)
as snapshot of northwind


--Aus dem Snapshot restoren

--keiner der beiden DBs darf kein User verwenden
--Aktivitätsmonitor: nach DB filtern
select db_id('Northwind')
select * from sysprocesses where dbid =  db_id('Northwind')
select * from sysprocesses where dbid =  db_id('sn_nwind_1416')

restore database northwind from database_snapshot= 'sn_nwind_1416'



--Fragen zum Snapshot

--Kann man den Snapshot sichern
--geht nicht

--kann man den Snapshto restoren?
--hä???

--kann man die OrigDB noch sichern ?
--jo logo

--kann man die OrigDB auch restore, wenn Snapshot vorhanden?
--nope..zuerst alle snapshots löschen

--kann man mehrere Snapshots haben?
--ja...




--Sicherung der DB?


--Größe der DB: 100GB
--Ausfallzeit max: 10min / 15min.. bei 5 --> Hochverfügbarkeit
--max Datenverlust in Zeit: 30min

--Arbeitszeit: von 5:30    bis 18:00
--- Mo bis Fr


--V dauert vermutlich keinen 10 min
--Mo bis Fr einmal pro tag.... 19:00

--T alle 15min  .. Mo bis Fr   6:00 -- 18:30

--D  alle 2 Ts ein D  ab 6:05 alle 30min























*/