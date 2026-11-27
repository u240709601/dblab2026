use company;
#1) Shows the customer locations.

CREATE VIEW view_customer_locations AS
SELECT CustomerName, Country FROM Customers;

SELECT * FROM view_customer_locations;

#2) Total quantity ordered for each product.

CREATE VIEW view_product_sales AS
Select P.ProductName,
	Sum(OD.Quantity) AS TotalQuantity
FROM OrderDetails OD
JOIN Products P ON OD.ProductId = P.ProductID
group by P.ProductName;

SELECT *FROM view_product_sales
WHERE TotalQuantity < 150;

#3) Countries With the Most Customers.

CREATE VIEW  view_customer_country_count AS
SELECT
	Country,
    COUNT(*) AS TotalCustomers
FROM Customers
GROUP BY Country
ORDER BY TotalCustomers DESC;

SELECT *FROM view_customer_country_count;

#4) Orders with Shipper Information.

CREATE VIEW view_order_shipper AS

SELECT
	O.OrderID,
    O.OrderDate,
    C.CustomerName,
    S.ShipperName
FROM Orders O 
JOIN Customers C ON O.CustomerId = C.Customerid
JOIN Shippers S ON O.ShipperId = S.ShipperId;

SELECT ShipperName, COUNT(*) AS OrderCount
FROM view_order_shipper
group by ShipperName
order by OrderCount DESC;

SELECT * FROM view_order_shipper;
