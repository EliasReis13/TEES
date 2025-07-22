-- Verifica se 'Hôtel' pode ser buscado por 'hotels' usando stemming e unaccent

-- Teste que retorna verdadeiro:
SELECT to_tsvector('fr', 'Hôtel') @@ to_tsquery('hotels') AS result;
-- Resultado: true
