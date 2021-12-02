{{ config(materialized='table') }}

SELECT
    o_orderdate,
    SUM(o_totalprice) AS total_price,
    SUM(total_price) over (
        ORDER BY
            o_orderdate rows BETWEEN 1 preceding
            AND CURRENT ROW
    ) AS cumulative_sales
FROM
    {{ source('tpch_sf1', 'orders') }}
GROUP BY
    o_orderdate
