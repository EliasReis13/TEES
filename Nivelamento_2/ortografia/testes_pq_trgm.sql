-- Teste para verificar a extensão pg_trgm está funcionando
SELECT similarity('Something', 'samething'); -- Deve retornar valor > 0.5

-- Teste para buscar o lexema mais próximo de 'samething'
SELECT word
FROM unique_lexeme
WHERE similarity(word, 'samething') > 0.5
ORDER BY word <-> 'samething'
LIMIT 1;
