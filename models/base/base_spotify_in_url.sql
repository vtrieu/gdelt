--Spotify directly referenced in Source URLs; base model
<<<<<<< HEAD
--adding comments to test git integration
=======
>>>>>>> master

{{ config(materialized='view') }}

select * 
from GLOBAL_EVENT_V2
where lower(SOURCEURL) like '%spotify%'