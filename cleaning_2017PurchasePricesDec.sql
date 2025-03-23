SELECT *
FROM wp_2017PurchasePricesDec

--Cleaning and standardizing data
UPDATE wp_2017PurchasePricesDec
SET [Description] = REPLACE([Description], '"','')

UPDATE wp_2017PurchasePricesDec
SET [Size] = REPLACE([Size], '"','')

UPDATE wp_2017PurchasePricesDec
SET [Volume] = REPLACE([Volume], '"','')

UPDATE wp_2017PurchasePricesDec
SET [VendorName] = REPLACE([VendorName], '"','')

--Change of data type
ALTER TABLE wp_2017PurchasePricesDec
ALTER COLUMN [Price] float

ALTER TABLE wp_2017PurchasePricesDec
ALTER COLUMN [Volume] float

ALTER TABLE wp_2017PurchasePricesDec
ALTER COLUMN [PurchasePrice] numeric(10,2)