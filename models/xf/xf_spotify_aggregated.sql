--aggregating xf_spotify_date

{{ config(materialized='view') }}

with SPOTIFY_STOCK_DATA as 
(
    select * from {{ref('base_spotify_stock_data')}}
),

SPOTIFY_STOCK_DATE as
(
    select * from {{ref('xf_spotify_date')}}
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