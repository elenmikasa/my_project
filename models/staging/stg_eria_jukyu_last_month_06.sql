{{ config(materialized='table') }}

{{ read_csv_with_added_columns('area_demand_last_month', '関西') }}