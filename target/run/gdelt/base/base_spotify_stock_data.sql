create or replace view SB_HACKATHON_DB_TEAM1.GDELT_RAW.base_spotify_stock_data as (
    -- Welcome to your first dbt model!
-- Did you know that you can also configure models directly within
-- the SQL file? This will override configurations stated in dbt_project.yml

-- Try changing 'view' to 'table', then re-running dbt



select * from SPOTIFY_STOCK_DATA
  );