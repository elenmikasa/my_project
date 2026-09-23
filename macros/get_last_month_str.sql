{% macro get_last_month_str() %}
  {# 今日の日付を取得し、今月1日の前日（＝先月末日）から先月のYYYYMMを計算 #}
  {% set today = modules.datetime.date.today() %}
  {% set first_of_this_month = today.replace(day=1) %}
  {% set last_month = first_of_this_month - modules.datetime.timedelta(days=1) %}
  
  {# YYYYMM 形式（例: 202608）で返す #}
  {{ return(last_month.strftime('%Y%m')) }}
{% endmacro %}