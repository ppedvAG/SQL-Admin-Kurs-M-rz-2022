--Security

/*

NT und SQL Logins = gemischte Auth

NT Konten --windows SID
SQL LOgin eine interne eig SID

*/
select * from syslogins
select * from sysusers


USE [master]
GO
CREATE LOGIN [Hans] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO


USE [Northwind]
GO
CREATE USER [Hans] FOR LOGIN [Hans]
GO


USE [master]
GO
CREATE LOGIN [Susi] WITH PASSWORD=N'123', DEFAULT_DATABASE=[Northwind], CHECK_EXPIRATION=OFF, CHECK_POLICY=OFF
GO
USE [Northwind]
GO
CREATE USER [Susi] FOR LOGIN [Susi]
GO


USE [Northwind]
GO
CREATE SCHEMA [IT] AUTHORIZATION [dbo]
GO

USE [Northwind]
GO
CREATE SCHEMA [MA] AUTHORIZATION [dbo]
GO


create table it.mitarbeiter (itma int)

create table it.projekte (itpro int)


create table ma.mitarbeiter (mama int)

create table ma.projekte (mapro int)


use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [Hans]
GO


use [Northwind]
GO
GRANT SELECT ON SCHEMA::[MA] TO [Susi]
GO

select * from orders
select * from dbo.orders

select * from mitarbeiter

select * from dbo.mitarbeiter

USE [Northwind]
GO
ALTER USER [Hans] WITH DEFAULT_SCHEMA=[IT]
GO


USE [Northwind]
GO
ALTER USER [Susi] WITH DEFAULT_SCHEMA=[MA]
GO


use [Northwind]
GO
GRANT SELECT ON [IT].[projekte] TO [Susi]
GO

alter view ma.itprojekte
as
select * from it.projekte



use [Northwind]
GO
GRANT CREATE TABLE TO [Susi]
GO


use [Northwind]
GO
GRANT ALTER ON SCHEMA::[MA] TO [Susi]
GO


USE [Northwind]
GO
CREATE ROLE [ITRolle] AUTHORIZATION [dbo]
GO
USE [Northwind]
GO
ALTER ROLE [ITRolle] ADD MEMBER [Hans]
GO


use [Northwind]
GO
REVOKE SELECT ON SCHEMA::[IT] TO [Hans] AS [dbo]
GO
use [Northwind]
GO
GRANT SELECT ON SCHEMA::[IT] TO [ITRolle]
GO

