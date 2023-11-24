-- models/example/joined_sales_data.sql

SELECT
    a.store_nbr,
    a.date,
    a.transactions,
    a.last_week_sales,
    b.avg_7_days_sales,
    c.sum_tran AS total_sales
FROM
    {{ ref('sales_7_days_lag') }} a
LEFT JOIN
    {{ ref('sales_7_days_moving_avg') }} b ON a.store_nbr = b.store_nbr AND a.date = b.date
LEFT JOIN
    {{ ref('sum_sales_by_storeXdate') }} c ON a.store_nbr = c.store_nbr AND a.date = c.date

