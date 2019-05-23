create or replace view SB_HACKATHON_DB_TEAM1.GDELT_RAW.base_spotify_in_url as (
    --Spotify directly referenced in Source URLs; base model



select * 
from GLOBAL_EVENT_V2
where lower(SOURCEURL) like '%spotify%'
  );