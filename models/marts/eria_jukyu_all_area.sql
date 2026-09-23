{{
    config(
        materialized='incremental',
        unique_key=['エリア名', 'partition_date', 'TIME'],
        on_schema_change='sync_all_columns'
    )
}}

select * from {{ ref('int_eria_jukyu_last_month_all_area') }}