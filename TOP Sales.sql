--Create a new table with the results of the previous query
WITH ProductMargins AS (
    SELECT p.Brand, p.[Description], p.Size,
        (s.SalesPrice - (p.PurchasePrice + i.Freight)) AS Margin, 
        ROW_NUMBER() OVER (PARTITION BY p.Brand, p.[Description], p.Size ORDER BY p.[Description]) AS [IDKey]
    FROM [wp_[0]]PurchasesFINAL2016] p
    INNER JOIN [wp_[0]]InvoicePurchases2016] i ON i.PONumber = p.PONumber
	INNER JOIN [wp_[0]]SalesFINAL2016] s ON s.InventoryId = p.InventoryId
)
SELECT Brand, [Description], Size, Margin
INTO [wp_[0]]ProductMargins]
FROM ProductMargins
WHERE [IDKey] = 1
ORDER BY Margin DESC;

--TOP 10 highest profit products
SELECT TOP(10)*
FROM [wp_[0]]ProductMargins]
ORDER BY Margin DESC;


--TOP 10 best-selling products
SELECT TOP(10) Brand, [Description], Size, SUM(SalesQuantity) AS TotalSalesQuantity
FROM [wp_[0]]SalesFINAL2016]
GROUP BY Brand, [Description], Size
ORDER BY TotalSalesQuantity DESC;


--TOP 10 most profitable vendors
SELECT TOP(10) VendorNo, VendorName, SUM(SalesDollars) AS TotalSalesByVendor
FROM [wp_[0]]SalesFINAL2016]
GROUP BY VendorNo, VendorName
ORDER BY TotalSalesByVendor DESC;