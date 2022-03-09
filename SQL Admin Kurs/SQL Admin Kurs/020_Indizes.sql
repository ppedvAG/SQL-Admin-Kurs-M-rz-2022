--INDEX Auswirkung

/*

Abfrage 30 sek --> 1 Sek

RAM Verbauch hoch (zu)... deutlich niedriger

IO ZUgriff rel hoch mit IX deutlich weniger


Clustered Index
pro Tabelle nur einmal 
CL = Tabelle, die wird immer sortiert sein

ohne CL IX = HEAP (Sauhaufen an Daten)
für Bereichabfragen



Non Clustered Index
Kopie der Daten in sortierter
rund 1000 N CL IX 
wenn rel wenig rauskommt



wenn man sehr viele IX hat...
--> I U D


---Fazit: nur die notwendige IX
--Fragementierung: --> Wartungplan jeden Tag nachts...
--unter 10 %  nix
--über 30% rebuild
---10 bis 30% reorg

überflüssige Indizes




fehlende IX



*/

select * from customers
insert into customers (customerid, CompanyName) values ('ppedv', 'Fa ppedv AG')


select * from sys.dm_db_index_usage_stats