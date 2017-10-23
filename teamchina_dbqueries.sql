USE UberDataBase
GO

--Multiple select* quieries to display all the records from each table--
SELECT *
FROM Customer

SELECT *
FROM Driver

SELECT *
FROM Trip

SELECT *
FROM Payment

--query that uses aggregate function--
SELECT  Count(OrderID) as NumberofOrders
FROM Trip
WHERE CustomerID = '666';


--query that select records from 2 or more tables using inner join--
SELECT C.FirstName, C.LastName, count(T.OrderID)
FROM Customer as C 
JOIN Trip as T
ON C.CustomerID = T.CustomerID
GROUP BY C.FirstName, C.LastName
ORDER BY count(T.OrderID);


--query that select records from two tables using left outer join--
SELECT C.FirstName, C.LastName, T.DriverID
FROM Customer as C 
LEFT OUTER JOIN Trip as T
ON C.CustomerID = T.CustomerID
--this query shows all customers and the uber drivers that they have encountered on their trips. A left outer join is necessary to show the customers who did not have a driver ID associated to them (where DriverID IS NULL)


--query that uses a subquery--
SELECT COUNT(DriverID) AS DriversWithAToyotaCorolla
FROM Driver
WHERE VehicleModel IN
(SELECT VehicleModel FROM Driver
	WHERE VehicleModel='ToyotaCorolla');