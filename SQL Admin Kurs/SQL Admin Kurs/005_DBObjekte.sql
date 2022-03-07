--Sichten (Views) 
--Prozeduren   (soted procedures)
--Funktionen

--Sicht = gemerkte Abfrage..wird wie Tabelle behandelt
--I U D.. Rechte auf Sichten 
--Sichten liefern immer aktuelle Daten



SELECT      TOP (100) PERCENT dbo.Customers.CompanyName, dbo.Customers.CustomerID, dbo.Customers.ContactName, dbo.Customers.ContactTitle, dbo.Customers.City, dbo.Customers.Country, dbo.Orders.OrderDate, dbo.Orders.Freight AS Lieferkosten, dbo.Orders.ShipCity, dbo.Orders.ShipCountry, 
                   dbo.Orders.EmployeeID, dbo.[Order Details].OrderID, dbo.[Order Details].ProductID, dbo.[Order Details].UnitPrice, dbo.[Order Details].Quantity, dbo.Products.ProductName, dbo.Products.UnitsInStock, dbo.Employees.LastName, dbo.Employees.FirstName
FROM         dbo.Customers INNER JOIN
                   dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID INNER JOIN
                   dbo.[Order Details] ON dbo.Orders.OrderID = dbo.[Order Details].OrderID INNER JOIN
                   dbo.Products ON dbo.[Order Details].ProductID = dbo.Products.ProductID INNER JOIN
                   dbo.Employees ON dbo.Orders.EmployeeID = dbo.Employees.EmployeeID
WHERE      (dbo.Orders.Freight > 0.01)
ORDER BY dbo.Orders.OrderDate




--STG + SHIF + R = Refresh der Autoverollständigung

select distinct CompanyName  from vKundeUmsatz where country = 'USA'
select CompanyName  from customers where country = 'USA'


create view ViewName
as
SELECT      TOP (100) PERCENT dbo.Customers.CompanyName, dbo.Customers.CustomerID, dbo.Customers.ContactName, dbo.Customers.ContactTitle, dbo.Customers.City, dbo.Customers.Country, dbo.Orders.OrderDate, dbo.Orders.Freight AS Lieferkosten, dbo.Orders.ShipCity, dbo.Orders.ShipCountry, 
                   dbo.Orders.EmployeeID, dbo.[Order Details].OrderID, dbo.[Order Details].ProductID, dbo.[Order Details].UnitPrice, dbo.[Order Details].Quantity, dbo.Products.ProductName, dbo.Products.UnitsInStock, dbo.Employees.LastName, dbo.Employees.FirstName
FROM         dbo.Customers INNER JOIN
                   dbo.Orders ON dbo.Customers.CustomerID = dbo.Orders.CustomerID INNER JOIN
                   dbo.[Order Details] ON dbo.Orders.OrderID = dbo.[Order Details].OrderID INNER JOIN
                   dbo.Products ON dbo.[Order Details].ProductID = dbo.Products.ProductID INNER JOIN
                   dbo.Employees ON dbo.Orders.EmployeeID = dbo.Employees.EmployeeID
WHERE      (dbo.Orders.Freight > 0.01)
ORDER BY dbo.Orders.OrderDate



create view myView1
as
SELECT      TOP (100) PERCENT Customers.CompanyName, Customers.CustomerID, Customers.ContactName, Customers.ContactTitle, Customers.City, Customers.Country, Orders.OrderDate, Orders.Freight AS Lieferkosten, Orders.ShipCity, Orders.ShipCountry, Orders.EmployeeID, [Order Details].OrderID, 
                   [Order Details].ProductID, [Order Details].UnitPrice, [Order Details].Quantity, Products.ProductName, Products.UnitsInStock, Employees.LastName, Employees.FirstName
FROM         Customers INNER JOIN
                   Orders ON Customers.CustomerID = Orders.CustomerID INNER JOIN
                   [Order Details] ON Orders.OrderID = [Order Details].OrderID INNER JOIN
                   Products ON [Order Details].ProductID = Products.ProductID INNER JOIN
                   Employees ON Orders.EmployeeID = Employees.EmployeeID
WHERE      (Orders.Freight > 0.01)
ORDER BY Orders.OrderDate






--Prozeduren: komplette Logik hinterlegen
--wie Windiws Bachtdateien
--schnell!!! "kompiliert"

alter proc gpdemo @par1 int
as
select * from customers
select top 3 * from orders where orderid = @par1
--IN UP DEL

exec gpdemo 10250


--F)( sind so gut wie immer : schlecht!!!!!
create function fzahl (@par1 int)
return int
as
Begin 

end

select f(wert) , f(Spalte) from f(Wert)


delete from customers where customerid = 'PARIS'