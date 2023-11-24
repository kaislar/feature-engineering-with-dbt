-- models/sum_sales_by_storeXdate.sql
WITH sales_agg AS (
    SELECT
        store_nbr,
        date,
        transactions,
        SUM(transactions) OVER (PARTITION BY store_nbr) AS sum_tran
    FROM
        {{ ref('sales') }}
)
SELECT * 
FROM
    sales_agg
ORDER BY
    store_nbr, date