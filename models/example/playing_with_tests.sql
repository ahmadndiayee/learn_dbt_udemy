{{ config(materialized='table') }}

SELECT * FROM {{ source('tpch_sf1', 'customer') }}