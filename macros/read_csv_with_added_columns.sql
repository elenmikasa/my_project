{% macro read_csv_with_added_columns(source_name, table_name) %}


with raw_data as (
    select * from read_csv(
        {{ source(source_name, table_name) }},
        encoding = 'SHIFT_JIS',
        header = true,
        all_varchar = true
    )
)
select
    '{{ table_name }}' as "エリア名",
    raw_data.*,
    strftime(
        case 
            when length(cast("date" as varchar)) = 8 and "date" not like '%/%' then strptime(cast("date" as varchar), '%Y%m%d')
            else try_cast("date" as DATE)
        end,
        '%Y-%m-%d'
    ) as partition_date
from raw_data
where "date" is not null

{% endmacro %}