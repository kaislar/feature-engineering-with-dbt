-- models/example/sales_7_days_moving_avg.sql
WITH sales_with_last_week AS (
    SELECT
        store_nbr,
        date,
        transactions,
        AVG(transactions) OVER (PARTITION BY store_nbr ORDER BY date ROWS BETWEEN 6 PRECEDING AND CURRENT ROW) AS avg_7_days_sales
    FROM
        {{ ref('sales') }}
)

SELECT
    store_nbr,
    date,
    transactions,
    avg_7_days_sales
FROM
    sales_with_last_week
ORDER BY
    store_nbr, date