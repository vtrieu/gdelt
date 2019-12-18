--Spotify directly referenced in Source URLs; base model
--adding comments to test git integration



select * 
from GLOBAL_EVENT_V2
where lower(SOURCEURL) like '%spotify%'