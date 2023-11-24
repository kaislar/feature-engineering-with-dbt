-- models/example/sales_7_days_lag.sql
WITH sales_with_last_week AS (
    SELECT
        store_nbr,
        date,
        transactions,
        LAG(transactions,7) OVER (PARTITION BY store_nbr ORDER BY date) AS last_week_sales
    FROM
        {{ ref('sales') }}
)

SELECT
    store_nbr,
    date,
    transactions,
    last_week_sales
FROM
    sales_with_last_week
ORDER BY
    store_nbr, date
