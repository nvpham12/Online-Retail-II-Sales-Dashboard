/*
This query:
- Removes duplicates using SELECT DISTINCT
- Creates an InvoiceDate_UTC column
- Removes UTC suffix from all invoice dates and renames column to InvoiceTimeStamp_UTC
- Filters out canceled orders (where Invoice starts with 'C'), nulls, and rows with non-positive quantities
- Orders data by InvoiceDate
- Processes 89.96 MB of data.
- Replaces the retail2 table with the resulting dataset
*/

CREATE OR REPLACE TABLE
  `online_retail_2_dataset.retail2` AS
SELECT
  DISTINCT Invoice,
  StockCode,
  Description,
  Quantity,
  DATE(InvoiceDate) AS InvoiceDate_UTC,
  FORMAT_TIMESTAMP('%F %T', InvoiceDate) AS InvoiceTimeStamp_UTC,
  Price,
  `Customer ID`,
  Country
FROM
  `online_retail_2_dataset.retail2`
WHERE
  Quantity > 0
  AND `Customer ID` IS NOT NULL
  AND Description IS NOT NULL
  AND Invoice NOT LIKE "C%"
  AND Country NOT IN ('Unspecified', 'European Community', 'West Indies');