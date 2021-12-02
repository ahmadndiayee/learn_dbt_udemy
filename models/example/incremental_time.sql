{{ config(materialized='incremental', unique_key='t_time') }}

select  
    *
from
    {{ source('tpcds_sf10tcl', 'time_dim') }}
where
    TO_TIME(
        CONCAT(
            t_hour :: varchar,
            ':',
            t_minute,
            ':',
            t_second
        )
    ) <= current_time

{% if is_incremental() %}
  and t_time > (select max(t_time) from {{ this }})
{% endif %}