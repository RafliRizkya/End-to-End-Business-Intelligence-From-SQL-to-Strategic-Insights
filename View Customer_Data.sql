-- SQLite
CREATE VIEW Customer_Data AS
SELECT
    o.OrderID,
    cust.CustomerID,
    cust.CompanyName as Company,
    cust.City,
    cust.Region,
    cust.Country,
    p.ProductID,
    p.ProductName as Product,
    cat.CategoryName as Category_Product,
    o.OrderDate as Order_Date,
    o.ShippedDate as Shipped_Date,
    CAST(JULIANDAY(o.ShippedDate) - JULIANDAY(o.OrderDate) AS INTEGER) as Processing_Days,
    s.CompanyName as Ship_Company,
    od.UnitPrice as Unit_Price,
    od.Quantity,
    od.Discount,
    (od.UnitPrice * od.Quantity * (1 - od.Discount)) as Total_Sales
FROM Orders as o 
INNER JOIN Customers as cust ON cust.CustomerID = o.CustomerID
LEFT JOIN Shippers as s ON o.ShipVia = s.ShipperID
LEFT JOIN `Order Details` as od ON o.OrderID = od.OrderID
LEFT JOIN Products as p ON od.ProductID = p.ProductID
LEFT JOIN Categories as cat on p.CategoryID = cat.CategoryID;

SELECT * FROM Customer_Data