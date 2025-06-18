CREATE VIEW Product_Inventory AS
SELECT 
    p.ProductID,
    p.ProductName,
    c.CategoryName,
    s.CompanyName AS SupplierName,
    p.UnitPrice,
    p.UnitsInStock,
    p.UnitsOnOrder,
    p.ReorderLevel,
    p.Discontinued,
    IFNULL(SUM(od.Quantity), 0) AS TotalUnitsOrdered,
    IFNULL(SUM(od.Quantity * od.UnitPrice * (1 - od.Discount)), 0) AS Revenue
FROM 
    Products p
LEFT JOIN 
    [Order Details] od ON p.ProductID = od.ProductID
LEFT JOIN 
    Categories c ON p.CategoryID = c.CategoryID
LEFT JOIN 
    Suppliers s ON p.SupplierID = s.SupplierID
GROUP BY 
    p.ProductID, 
    p.ProductName, 
    c.CategoryName,
    s.CompanyName,
    p.UnitPrice,
    p.UnitsInStock,
    p.UnitsOnOrder,
    p.ReorderLevel,
    p.Discontinued
ORDER BY 
    Revenue DESC;

SELECT * FROM Product_Inventory


