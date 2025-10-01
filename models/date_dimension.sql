with cte as (
select to_timestamp(started_at) as started_at
,      DATE(to_timestamp(started_at)) as date_started_at
,      HOUR(to_timestamp(started_at)) as hour_started_at
,       {{daytype('started_at')}} as daytype
,       {{get_season('started_at')}} as station_of_year
from {{ source('demo', 'bike') }}
where started_at<>'started_at'
)

select * from cte