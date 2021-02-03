-- Multi-Table Query Practice

-- Display the ProductName and CategoryName for all products in the database. Shows 77 records.
SELECT p.productname, c.categoryname 
FROM product as p 
JOIN Category as c on p.categoryid = c.id

-- Display the order Id and shipper CompanyName for all orders placed before August 9 2012. Shows 429 records.
SELECT o.id, s.CompanyName 
FROM [order] as o 
JOIN Shipper as s on ShipVia = s.id 
WHERE o.OrderDate < '2012-08-09'

-- Display the name and quantity of the products ordered in order with Id 10251. Sort by ProductName. Shows 3 records.
SELECT p.ProductName, od.Quantity
FROM OrderDetail as od
JOIN Product as p on od.ProductId = p.Id
WHERE od.OrderId = 10251
ORDER BY ProductName

-- Display the OrderID, Customer's Company Name and the employee's LastName for every order. All columns should be labeled clearly. Displays 16,789 records.
SELECT o.id as "Order ID", c.CompanyName as "Company Name", e.LastName as "Employee Last Name"
FROM [Order] as o
JOIN customer as c on c.id = o.CustomerId
JOIN employee as e on e.id = o.EmployeeId