with bike as 
(
    select
            RIDE_ID ,
			replace(STARTED_AT ,'"','') as STARTED_AT,
			replace(ENDED_AT ,'"','') as ENDED_AT,
			replace(START_STATION_NAME ,'"','') as START_STATION_NAME,
			START_STATIO_ID ,
			replace(END_STATION_NAME ,'"','') as END_STATION_NAME,
			END_STATION_ID ,
			START_LAT ,
			START_LNG ,
			END_LAT ,
			END_LNG ,
			replace(MEMBER_CSUAL,'"','') as MEMBER_CSUAL,
            '' as rideable_type
from {{ source('demo', 'bike') }}
where ride_id not in ('"bikeid"','bikeid')
limit 99
)
select * from bike