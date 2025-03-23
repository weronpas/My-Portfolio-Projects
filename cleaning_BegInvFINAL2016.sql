SELECT *
FROM wp_BegInvFINAL12312016

--Cleaning and standardizing data
UPDATE wp_BegInvFINAL12312016
SET [InventoryId] = REPLACE([InventoryId], '"','')

UPDATE wp_BegInvFINAL12312016
SET [City] = REPLACE([City], '"','')

UPDATE wp_BegInvFINAL12312016
SET [Description] = REPLACE([Description], '"', '')

UPDATE wp_BegInvFINAL12312016
SET [Size] = REPLACE([Size], '"', '')

--Change of data type
ALTER TABLE wp_BegInvFINAL12312016
ALTER COLUMN [onHand] int

ALTER TABLE wp_BegInvFINAL12312016
ALTER COLUMN [Price] numeric(10,2)

ALTER TABLE wp_BegInvFINAL12312016
DROP COLUMN [startDate]

--Change of table name
EXEC sp_rename 'wp_BegInvFINAL12312016', 'wp_BegInvFINAL2016'