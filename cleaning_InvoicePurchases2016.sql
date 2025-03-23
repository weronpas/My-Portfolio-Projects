SELECT TOP 100 *
FROM wp_InvoicePurchases12312016

--Cleaning and standardizing data
UPDATE wp_InvoicePurchases12312016
SET [VendorName] = REPLACE([VendorName], '"','')

UPDATE wp_InvoicePurchases12312016
SET [InvoiceDate] = REPLACE([InvoiceDate], '"','')

UPDATE wp_InvoicePurchases12312016
SET [PODate] = REPLACE([PODate], '"','')

ALTER TABLE wp_InvoicePurchases12312016
DROP COLUMN [PayDate]

DELETE FROM wp_InvoicePurchases12312016
WHERE Approval <> '"None"'

ALTER TABLE wp_InvoicePurchases12312016
DROP COLUMN [Approval]

--Change of data type
ALTER TABLE wp_InvoicePurchases12312016
ALTER COLUMN [InvoiceDate] Date

ALTER TABLE wp_InvoicePurchases12312016
ALTER COLUMN [PODate] Date

ALTER TABLE wp_InvoicePurchases12312016
ALTER COLUMN [Quantity] int

ALTER TABLE wp_InvoicePurchases12312016
ALTER COLUMN [Dollars] numeric(10,2)

ALTER TABLE wp_InvoicePurchases12312016
ALTER COLUMN [Freight] numeric(10,2)

--Change of table name
EXEC sp_rename 'wp_InvoicePurchases12312016', 'wp_InvoicePurchases2016'
