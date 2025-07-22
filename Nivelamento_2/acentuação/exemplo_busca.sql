SELECT to_tsvector('fr', 'Hôtel') @@ to_tsquery('hotels') AS result;-- Resultado: false

SELECT to_tsvector('fr', 'Hôtel') @@ to_tsquery('fr', 'hotels') AS result; -- Resultado: true
