-- Exemplos básicos para entender como ts_rank funciona

SELECT ts_rank(to_tsvector('This is an example of document'),
               to_tsquery('example | document')) AS relevancy;
-- Resultado esperado: ~0.06079

SELECT ts_rank(to_tsvector('This is an example of document'),
               to_tsquery('example')) AS relevancy;
-- Resultado esperado: ~0.06079

SELECT ts_rank(to_tsvector('This is an example of document'),
               to_tsquery('example | unknown')) AS relevancy;
-- Resultado esperado: ~0.03039

SELECT ts_rank(to_tsvector('This is an example of document'),
               to_tsquery('example & document')) AS relevancy;
-- Resultado esperado: ~0.09850

SELECT ts_rank(to_tsvector('This is an example of document'),
               to_tsquery('example & unknown')) AS relevancy;
-- Resultado esperado: ~1e-20
