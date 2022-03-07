--Viele fehler gemacht!!
--Vermeide HDD Aktivit‰ten

create database testdb

--Wie groﬂ?
--16 MB
--mdf 8MB
--ldf   8MB

--Welches Wachstum?
--mdf: 64MB
--ldf:  64 MB


--bis SQL 2014
--5 +3 MB= 8MB
--1 MB bei Daten und 10% bei Logfiles


--Best Practice

--Wie groﬂ in 3 Jahren?---1000MB Das Backup wird nicht belastet
--
--Logfile 25%  Wachstum 1000MB

--Evtl Zeilenversionierung aktivieren
USE [master]
GO
ALTER DATABASE [Northwind] SET READ_COMMITTED_SNAPSHOT ON WITH NO_WAIT
GO

GO
ALTER DATABASE [Northwind] SET ALLOW_SNAPSHOT_ISOLATION ON
GO


--Fazit.. Schreiben hindert ein Lesen nicht mehr
--Traffic zur tempdb



--Statistiken..
--Grundeinstellungen belassen...


USE [Northwind]

GO

CREATE SEQUENCE [dbo].[seqID] 
 START WITH 1
 INCREMENT BY 1

select next value for seqId


Datentypen:



--Famname: Huber
varchar(50)  'Huber'  5 
char(50)        'Huber                                              '   50
nchar(50)     'Huber                                               '  50 *2
nvarchar(50) 'Huber'  5 * 2 

--varchar bei flexiblen L‰ngen und char bei fixen L‰ngen



Datum 

datetime (ms)



date
time
datetime2 (ns)
datetimeoffset (ms und Zeitzone)

select * from orders where year(orderdate) = 1997 --richtig aber langsamte Variante

select * from orders where orderdate between ' 1.1.1997' and '31.12.1997' --falsch


select * from orders where orderdate between ' 1.1.1997' and '31.12.1997 23:59:59.999' --falsch
--weil datetime etwas ungenau ist: (2 bis 3 ms)

decimal (10,2) -- 10 stellen L‰nge da von 2 Nachkomma
money

MAX ( 2GB)


