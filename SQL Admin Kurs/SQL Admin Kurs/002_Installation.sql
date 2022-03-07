/*
Instanzen

50 mal auf einem Rechner

jede Instanz ist total autark
eig Prozesse DB, Ram

versch Installation möglich  SQL 2016 und 2017 und 2019 gemischt

StdInstanz:				Rechnername                                       1433 nur 1mal  MSSQLSERVER
benannte Instanz:	Rechnername\Instanzname					????

Idee: Warum Instanzen: Software 

Instanzfunktion
mehrfache Insallation

Dienste
SQL Agent --> Jobs Aufträge
SQL Server--> DB Engine
Browser
Volltext

Dienstkonto: DomänenUser, 
	NT Service\....  unbeaufsichtigte Dienstkonten (autom Kennwortänderungen)
	lokales Konto
	Remotezugriffe per Computerkonto


Security
NT Auth
gemischte Auth: Wahl zw NT Auth und/oder SQL Auth (...wenn es mit NT nicht geht..)

SQL Login: SA + komplexes Kennwort
diesen später deaktivern und Alternative


--> Windows Admin ist kein SQL Admin


Pfaden
Db besteht aus  2 Dateien:   .mdf (master data file..Daten)   .ldf (log data file)
Trenne Daten von Logfiles physikalisch (HDD)
Pfad für Backup


Feature : DB Engine + Volltext + Replikation
Freug Funktionen: Clientkonnektivität


TempDB

Anzahl der Dateien = Kerne , nicht mehr als 8
eig HDDs bekommen

Maxdop = Anzahl der Kerne , aber nicht mehr als 8


Max Arbeitspeicher = Gesamt - OS (2157)



"Auto Garage Haus "

where sp like '%Garage%'





*/

