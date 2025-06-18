CREATE VIEW Sales_Performance AS 
SELECT
    o.OrderID,
    e.EmployeeID,
    e.FirstName || ' ' || e.LastName AS Sales_Name,
    cust.CompanyName as Customer_Name,
    o.OrderDate,
    o.ShippedDate,
    p.ProductName as Product,
    cat.CategoryName as Category,
    od.UnitPrice as Unit_Price,
    od.Quantity,
    od.Discount,
    od.UnitPrice * od.Quantity *(1 - od.Discount) as Total_Sales
FROM Orders o
LEFT JOIN Employees e ON o.EmployeeID = e.EmployeeID
LEFT JOIN Customers cust ON o.CustomerID = cust.CustomerID
LEFT JOIN `Order Details` od ON o.OrderID = od.OrderID
LEFT JOIN Products p ON od.ProductID = p.ProductID
LEFT JOIN Categories cat ON p.CategoryID = cat.CategoryID;

SELECT * FROM Sales_Performance
