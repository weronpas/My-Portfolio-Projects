SELECT *
FROM wp_PurchasesFINAL12312016

--Cleaning and standardizing data
UPDATE wp_PurchasesFINAL12312016
SET 
    [InventoryId] = REPLACE([InventoryId], '"', ''),
    [Description] = REPLACE([Description], '"', ''),
    [Size] = REPLACE([Size], '"', ''),
    [VendorName] = REPLACE([VendorName], '"', ''),
    [PODate] = REPLACE([PODate], '"', ''),
    [ReceivingDate] = REPLACE([ReceivingDate], '"', ''),
    [InvoiceDate] = REPLACE([InvoiceDate], '"', ''),
    [PayDate] = REPLACE([PayDate], '"', '');

--Change of data type
ALTER TABLE wp_PurchasesFINAL12312016
DROP COLUMN [Classification]

ALTER TABLE wp_PurchasesFINAL12312016
ALTER COLUMN [ReceivingDate] date

ALTER TABLE wp_PurchasesFINAL12312016
ALTER COLUMN [InvoiceDate] date

ALTER TABLE wp_PurchasesFINAL12312016
ALTER COLUMN [PayDate] date

DELETE FROM wp_PurchasesFINAL12312016
WHERE ISDATE([PODate]) = 0

ALTER TABLE wp_PurchasesFINAL12312016
ALTER COLUMN [PODate] date

--Change of table name
EXEC sp_rename 'wp_PurchasesFINAL12312016', 'wp_PurchasesFINAL2016'