/*
Tipp: Regelm��ige Sicherung der systemDbs per Wartungspan...
jeden Tag


master
Logins, Datenbanken, Settings "Herz"

Backup: jupp!


model
create database testdb (kopie der model)
Vorlage f�r neue! DBs

muss man die Model sichern? theoretisch ja..cooler per Script

USE [master]
GO
ALTER DATABASE [model] SET RECOVERY BULK_LOGGED WITH NO_WAIT
GO


msdb
Db f�r den Agent.. Auftr�ge, Mail, Zeitpl�ne, Wartungspl�ne, SSIS Pakete, Warnungen

Backup: auf jeden Fall


tempdb
temp Tabellen, Zeilenversionierung, Wartungen
 Backup: no!!


distribution
bei Replikation 
Backup: ja




*/