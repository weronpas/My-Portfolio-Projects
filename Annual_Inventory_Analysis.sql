--What products were added in 2016?
SELECT e.*
FROM [wp_[0]]EndInvFINAL2016] e
LEFT JOIN [wp_[0]]BegInvFINAL2016] b ON e.[InventoryId] = b.[InventoryId]
WHERE b.[InventoryId] IS NULL;

--What products were removed in 2016?
SELECT b.*
FROM [wp_[0]]BegInvFINAL2016] b
LEFT JOIN [wp_[0]]EndInvFINAL2016] e ON b.[InventoryId] = e.[InventoryId]
WHERE e.[InventoryId] IS NULL;

--Products on sale all year long
SELECT b.*
FROM [wp_[0]]BegInvFINAL2016] b
INNER JOIN [wp_[0]]EndInvFINAL2016] e ON b.[InventoryId] = e.[InventoryId];

--Which spirits have become more expensive over the year and by how much?
WITH RankedProducts AS (
    SELECT b.Brand, b.[Description], b.Size, b.Price AS BeginPrice, e.Price AS EndPrice, (e.Price - b.Price) AS PriceIncrease,
        ROW_NUMBER() OVER (PARTITION BY b.Brand, b.[Description], b.Size ORDER BY (e.Price - b.Price) DESC) AS RowNum
    FROM [wp_[0]]BegInvFINAL2016] b
    LEFT JOIN [wp_[0]]EndInvFINAL2016] e ON b.[InventoryId] = e.[InventoryId]
    WHERE e.Price > b.Price
)
SELECT Brand, [Description], Size, BeginPrice, EndPrice, PriceIncrease
FROM RankedProducts
WHERE RowNum = 1
ORDER BY PriceIncrease DESC;

--Which spirits have become cheaper over the year and by how much?
WITH RankedProducts AS (
    SELECT b.Brand, b.[Description], b.Size, b.Price AS BeginPrice, e.Price AS EndPrice, (e.Price - b.Price) AS PriceIncrease,
        ROW_NUMBER() OVER (PARTITION BY b.Brand, b.[Description], b.Size ORDER BY (e.Price - b.Price) DESC) AS RowNum
    FROM [wp_[0]]BegInvFINAL2016] b
    LEFT JOIN [wp_[0]]EndInvFINAL2016] e ON b.[InventoryId] = e.[InventoryId]
    WHERE e.Price < b.Price
)
SELECT Brand, [Description], Size, BeginPrice, EndPrice, PriceIncrease
FROM RankedProducts
WHERE RowNum = 1
ORDER BY PriceIncrease DESC;
