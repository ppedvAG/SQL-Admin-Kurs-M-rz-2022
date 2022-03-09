--JamesBond ist ein verwaister User..hat kein Login
--

--Lösung

/*
JamesBond als Login anlegen

USE [master]
GO
CREATE LOGIN [JamesBond] WITH PASSWORD=N'123', DEFAULT_DATABASE=[whoamiDB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO

USE [master]
GO
CREATE LOGIN [JamesBond] WITH PASSWORD=N'123', DEFAULT_DATABASE=[whoamiDB], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [JamesBond] FOR LOGIN [JamesBond] Errro  JB ist schon vorhanden
GO



Bringt nix!! wg anderer SID

--Wie wurden die Rechte vergeben: konsequent über Rollen

Workaround
--JamesBond aus DB löschen, dann Login mit USermapping und MItgleid in Rolle Personalabt



andere Lösung



*/


use whoamiDB

sp_change_users_login 'Report' --zeigt alle verwaisten User an
--JamesBond	0xD1CC690FDC6EEC4B9683D2CCE45B7B73


--passendes Login anlegen mit der gleichen SID
sp_change_users_login 'Auto_fix', 'JamesBond', NULL, 'ppedv2019!'



--was wenn schon ein Login JamesBond vorhanden ist, aber eine andere SID hat
sp_change_users_login 'Update_one', 'JamesBond', 'JamesBond'

--Problem: diese Prozedur ist depricated..



--Lösung 3: wenn der "alte" Server nich aktiv ist:

sp_help_revlogin

IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = N'Susi')
                  BEGIN
CREATE LOGIN [Susi] WITH PASSWORD = 0x02003C841E4312B952CFAE916CBB3A698AA6967699491E4EEA86E108268AC9B87D45C2985CAC8F74F2586E80D31BB1B8C46EB491812A6FDE42698227D23A98E221842F40DBE8 HASHED, SID = 0x295A6A40F19AFC4DB7CB797A16033A9C, DEFAULT_DATABASE = [Northwind], DEFAULT_LANGUAGE = [Deutsch], CHECK_POLICY = OFF, CHECK_EXPIRATION = OFF
 
END

--per SQLCMD

C:\Users\Administrator>sqlcmd -E -SKairo -dmaster -Q"sp_help_revlogin"  -oC:\logins.sql

C:\Users\Administrator>sqlcmd -E -SKairo\HR -ic:\logins.sql