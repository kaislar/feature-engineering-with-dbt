-- models/example/sales_by_store.sql (totals)
WITH aggregated_sales AS (
    SELECT
        store_nbr,
        SUM(transactions) AS total_transactions
    FROM
        {{ ref('sales') }}
        
    GROUP BY
         store_nbr
)

SELECT * FROM aggregated_sales