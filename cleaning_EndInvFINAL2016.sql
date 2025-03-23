SELECT TOP 100 *
FROM wp_EndInvFINAL12312016

--Cleaning and standardizing data
UPDATE wp_EndInvFINAL12312016
SET [InventoryId] = REPLACE([InventoryId], '"','')

UPDATE wp_EndInvFINAL12312016
SET [City] = REPLACE([City], '"','')

UPDATE wp_EndInvFINAL12312016
SET [Description] = REPLACE([Description], '"', '')

UPDATE wp_EndInvFINAL12312016
SET [Size] = REPLACE([Size], '"', '')

--Change of data type
ALTER TABLE wp_EndInvFINAL12312016
ALTER COLUMN [onHand] int

ALTER TABLE wp_EndInvFINAL12312016
ALTER COLUMN [Price] numeric(10,2)

ALTER TABLE wp_EndInvFINAL12312016
DROP COLUMN [endDate]

--Change of table name
EXEC sp_rename 'wp_EndInvFINAL12312016', 'wp_EndInvFINAL2016'