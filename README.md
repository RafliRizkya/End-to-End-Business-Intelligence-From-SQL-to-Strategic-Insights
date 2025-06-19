# End-to-End-Business-Intelligence-From-SQL-to-Strategic-Insights

This project demonstrates an end-to-end business intelligence solution, covering data extraction and transformation using SQL views, customer segmentation with RFM analysis, and K-Means clustering for product inventory and sales performance.

Project Structure
The project is structured around key business intelligence phases, each supported by specific code and visualizations.

## SQL View Definitions
SQL views are created to simplify data access and pre-process data for analysis.

### Customer Data View
![Customer Data View](Create%20View%20Customer%20Data.png)
This view (Customer_Data) consolidates information about orders, customers, products, and categories. It includes OrderID, CustomerID, Company Name, City, Region, Country, ProductID, Product Name, Category_Product, Order_Date, Shipped_Date, Processing_Days (calculated as the difference between ShippedDate and OrderDate), Ship_Company, Unit_Price, Quantity, Discount, and Total_Sales. This view is instrumental for comprehensive customer behavior analysis.

### Sales Performance View
![Sales Performance View](Create%20View%20Sales%20Performance.png)
The Sales_Performance view provides a detailed look into sales transactions, linking orders with employees, customers, products, and categories. It includes OrderID, EmployeeID, Sales_Name, Customer_Name, OrderDate, ShippedDate, Product, Category, Unit_Price, Quantity, Discount, and Total_Sales. This view is crucial for evaluating sales team performance and identifying top-selling products.

### Product Inventory View
![Product Inventory View](Create%20View%20Product%20Inventory.png)
The Product_Inventory view summarizes product-related information, including total units ordered and revenue generated. It contains ProductID, ProductName, CategoryName, SupplierName, UnitPrice, UnitsInStock, UnitsOnOrder, ReorderLevel, Discontinued, TotalUnitsOrdered, and Revenue. This view is essential for inventory management and understanding product profitability.

## Northwind ERD
![Northwind ERD](Northwind_ERD.png)
The Entity-Relationship Diagram (ERD) for the Northwind database illustrates the relationships between different tables (Products, Orders, Employees, Customers, Suppliers, Categories, etc.). This diagram provides a clear understanding of the database schema, which is fundamental for constructing accurate SQL queries and views.

## RFM Analysis for Customer Segmentation
Recency, Frequency, and Monetary (RFM) analysis is a powerful technique to segment customers based on their purchasing behavior.

### RFM Score Calculation
![RFM Score Calculation](Nilai%20RFM.png)
This Python script calculates RFM scores for customers. It quantiles Recency, Frequency, and Monetary values into 5 bins, assigning scores from 1 to 5. The individual R, F, and M scores are then concatenated to form an RFM_Score and summed to create a Total_Score. Customers are then sorted by Total_Score in descending order.

### RFM Customer Segmentation
![RFM Customer Segmentation](Clustering%20RFM.png)
Building upon the RFM scores, this Python function rfm_segment(df) assigns descriptive segments to customers:

- Champions: Customers with an RFM_Score of 555 (highest scores in Recency, Frequency, and Monetary).
- Loyal Customers: High Recency and Frequency scores.
- Potential Loyalists: High Recency and Monetary scores.
- Lost Customers: Low Recency, Frequency, and Monetary scores.
- At Risk: Low Recency, but potentially good past customers.
- Needs Attention: Customers who buy but infrequently or spend little.
- Regular Customers: All other segments.
- This segmentation helps in tailoring marketing strategies for different customer groups.

## K-Means Clustering
K-Means clustering is applied to further segment product inventory and analyze yearly sales reports.

### K-Means on Product Inventory
![K-Means Product Inventory](Hasil%20K-Means%20Product%20Inventory.png)
This visualization displays the Elbow Method and Silhouette Score for K-Means clustering on product inventory data. The Elbow Method helps determine the optimal number of clusters by looking for the "elbow" point in the plot of within-cluster sum of squares. The Silhouette Score measures how similar an object is to its own cluster compared to other clusters, providing another metric for optimal cluster number. These plots guide the selection of the most appropriate k for product segmentation.

### K-Means on Yearly Sales Report
![K-Means Yearly Sales Report](Hasil%20K-Means%20Yearly%20Sales%20Report.png)
Similar to product inventory, these plots show the Elbow Method and Silhouette Score for K-Means clustering applied to yearly sales report data (potentially after PCA). This analysis aids in identifying distinct sales patterns or customer segments based on their yearly purchasing behavior. The presence of "Hasil PCA" in the title suggests that Principal Component Analysis (PCA) was used to reduce dimensionality before clustering.

### K-Means Clustering (k=4) on PCA-reduced Data
![K-Means Clustering (k=4)](KMeans%20Clustering%20(k=4)%20on%20PCA-reduced%20Data.png)
This scatter plot visualizes the results of K-Means clustering with k=4 on PCA-reduced data. Each point represents a data instance (e.g., a customer or a product), colored according to its assigned cluster. The "X" markers represent the cluster centroids. This visualization helps in understanding the distinct groups identified by the clustering algorithm and their distribution in the reduced-dimension space.

### Conclusion & License
This project showcases the integration of SQL-based data transformation, Python-powered customer analytics, and clustering techniques to deliver actionable business insights. It serves as a comprehensive end-to-end example of business intelligence implementation using the Northwind database.

Special thanks to [jpwhite3/northwind-SQLite3](https://github.com/jpwhite3/northwind-SQLite3) for providing the dataset, which is distributed under the [MIT License](https://github.com/jpwhite3/northwind-SQLite3/blob/master/LICENSE).

