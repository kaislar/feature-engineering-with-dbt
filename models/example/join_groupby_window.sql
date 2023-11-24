-- models/example/join_groupby_window.sql

SELECT  a.store_nbr, 
        a.date,
        transactions,
        sum_tran as window_fn_result,
        total_transactions as groupby_result
FROM
    {{ ref('sum_sales_by_storeXdate') }} a
LEFT JOIN 
    {{ ref('sales_by_store') }} b
ON a.store_nbr = b.store_nbr
--WHERE date < '2013-01-05'