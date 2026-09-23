{{ config(materialized='table') }}

select * from {{ ref('stg_eria_jukyu_last_month_01') }}
union all by name
select * from {{ ref('stg_eria_jukyu_last_month_03') }}
union all by name
select * from {{ ref('stg_eria_jukyu_last_month_06') }}
union all by name
select * from {{ ref('stg_eria_jukyu_last_month_09') }}