--Reformatting dates; xf

-- configuring this model as ephemeral so that it doesn't get materialized in the db
{{ config(materialized='ephemeral') }}


select 
      to_timestamp_ntz(cast(DATEADDED as string), 'YYYYMMDD HH24MISS') as Date_Added
    , GoldsteinScale
    , NumArticles
    , AvgTone
    , 'Spotify Mention' as Spotify
    , SourceURL
from {{ref('base_spotify_in_url')}} --using ref() functions, dbt understands dependencies between models and creates DAGs in  proper order 
where NumArticles is not null and NumMentions is not null and AvgTone is not null
order by dateadded asc