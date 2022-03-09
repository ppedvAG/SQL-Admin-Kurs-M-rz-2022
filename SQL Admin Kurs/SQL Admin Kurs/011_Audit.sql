--Audit = Datei ist nur reine Aufzeichnugsdatei

USE [master]

GO

CREATE SERVER AUDIT [Security]
TO FILE 
(	FILEPATH = N'D:\_BACKUP'
	,MAXSIZE = 0 MB
	,MAX_ROLLOVER_FILES = 2147483647
	,RESERVE_DISK_SPACE = OFF
) WITH (QUEUE_DELAY = 1000, ON_FAILURE = CONTINUE)

GO


--ÜBerwachug auf Server oder Datenbank

USE [master]

GO

CREATE SERVER AUDIT SPECIFICATION [Logins]
FOR SERVER AUDIT [Security]
ADD (LOGIN_CHANGE_PASSWORD_GROUP),
ADD (FAILED_LOGIN_GROUP),
ADD (SUCCESSFUL_LOGIN_GROUP)

GO


--Überwachung auf DB
USE [Northwind]

GO

CREATE DATABASE AUDIT SPECIFICATION [Zugriff_Employees_Susi]
FOR SERVER AUDIT [Security]
ADD (SELECT ON OBJECT::[dbo].[Employees] BY [Susi])

GO





SELECT * FROM sys.fn_get_audit_file
('d:\_Backup\Security_E9FA1F43-3897-4D57-86CB-8959775C128E_0_132912972735990000.sqlaudit',default,default)
where database_principal_name = 'Susi'
GO  
