--Calculation of product margins
WITH ProductMargins AS (
    SELECT p.Brand, p.[Description], p.Size, p.PONumber,
        (s.SalesPrice - (p.PurchasePrice + i.Freight)) AS Margin, 
        ROW_NUMBER() OVER (PARTITION BY p.Brand, p.[Description], p.Size ORDER BY p.[Description]) AS [IDKey]
    FROM [wp_[0]]PurchasesFINAL2016] p
    INNER JOIN [wp_[0]]InvoicePurchases2016] i ON i.PONumber = p.PONumber
	INNER JOIN [wp_[0]]SalesFINAL2016] s ON s.InventoryId = p.InventoryId
)
SELECT Brand, [Description], Size, Margin, PONumber
FROM ProductMargins
WHERE [IDKey] = 1 AND PONumber = '12969'
ORDER BY Margin DESC