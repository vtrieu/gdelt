create transient table SB_HACKATHON_DB_TEAM1.GDELT_RAW.xf_spotify_aggregated__dbt_tmp
  as (
    --aggregating xf_spotify_date



with  __dbt__CTE__xf_spotify_date as (
--Reformatting dates; xf

-- configuring this model as ephemeral so that it doesn't get materialized in the db



select 
      to_timestamp_ntz(cast(DATEADDED as string), 'YYYYMMDD HH24MISS') as Date_Added
    , GoldsteinScale
    , NumArticles
    , AvgTone
    , 'Spotify Mention' as Spotify
    , SourceURL
from SB_HACKATHON_DB_TEAM1.GDELT_RAW.base_spotify_in_url --using ref() functions, dbt understands dependencies between models and creates DAGs in  proper order 
where NumArticles is not null and NumMentions is not null and AvgTone is not null
order by dateadded asc
),SPOTIFY_STOCK_DATA as 
(
    select * from SB_HACKATHON_DB_TEAM1.GDELT_RAW.base_spotify_stock_data
),

SPOTIFY_STOCK_DATE as
(
    select * from __dbt__CTE__xf_spotify_date
)

select 
      Date_Added
    , Spotify
    , avg(GoldsteinScale) as Avg_GoldensteinScale
    , avg(NumArticles) as Avg_Articles
    , avg(AvgTone) as Avg_Tone
    , avg(Open) as "Open"
    , avg(Close) as "Close"
from SPOTIFY_STOCK_DATE DT  left join SPOTIFY_STOCK_DATA DTA on DT.Date_Added = DTA."Date"
group by Date_Added, Spotify 
order by Date_added asc
  );