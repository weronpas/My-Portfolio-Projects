select top 100 *
from wp_SalesFINAL12312016

--Change of data type
ALTER TABLE wp_SalesFINAL12312016
ALTER COLUMN [SalesQuantity] int

ALTER TABLE wp_SalesFINAL12312016
ALTER COLUMN [SalesDollars] numeric(10,2)

ALTER TABLE wp_SalesFINAL12312016
ALTER COLUMN [SalesPrice] numeric(10,2)

ALTER TABLE wp_SalesFINAL12312016
ALTER COLUMN [SalesDate] date

ALTER TABLE wp_SalesFINAL12312016
ALTER COLUMN [ExciseTax] numeric(10,2)

--Change of table name
EXEC sp_rename 'wp_SalesFINAL12312016', 'wp_SalesFINAL2016'