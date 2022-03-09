--DB Objekte


/*

adhoc Abfragen auf Tabellen

Sichten (Views)
sind gemerkte Abfragen
Sichten werden wie Tabellen behandelt... I U D S, auch Rechte auf Sichten

create view Sichtname
as
select .....

Sicht nun schneller als  die Abfrage, die dahinter steckt

--gleich schnell!!
--um komplexeren Code schreiben zu müssen
--aus Securitygründen: 
--den Zugriff auf Tabelle X verweigern und per Sicht erlauben.. 
--das funktioniert

Gesp Prozeduren ( stored procedures)

exec sprocedure @par1

exec gpSuxcheKunden 127

wie ein Windows Batch
create proc gpdemo1 @par1 int, @par2 int
as
U D S I U D D D S U 
--um Businesslogik abzublden

--sie ist auch schneller.. als der Code ohne Proc


Function ..ist meist langsamer(schlecht)





Funktionen



Indizes



*/

select * from sicht