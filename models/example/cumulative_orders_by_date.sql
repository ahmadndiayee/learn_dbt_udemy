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
    "SNOWFLAKE_SAMPLE_DATA"."TPCH_SF1"."ORDERS"
GROUP BY
    o_orderdate
