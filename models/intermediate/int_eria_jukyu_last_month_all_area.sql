{{ config(materialized='table') }}

select * from {{ ref('stg_hokkaido') }}
union all by name
select * from {{ ref('stg_tokyo') }}
union all by name
select * from {{ ref('stg_eria_jukyu_last_month_06') }}
union all by name
select * from {{ ref('stg_kyushu') }}