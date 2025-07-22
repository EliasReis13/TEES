-- SELECT to_tsvector('english', 'We are running'); -- 'run':3  → stemming aplicado
-- SELECT to_tsvector('french', 'We are running'); -- 'we':1 'are':2 'running':3  → sem stemming, pois "running" não é francês
SELECT to_tsvector('simple', 'We are running'); "-- 'we':1 'are':2 'running':3  → sem ignorar palavras nem aplicar stemming"
