-- Cria uma nova configuração de busca textual para francês, com suporte a unaccent
CREATE TEXT SEARCH CONFIGURATION fr ( COPY = french );

-- Altera o mapeamento de palavras para usar unaccent + french_stem
ALTER TEXT SEARCH CONFIGURATION fr
ALTER MAPPING FOR hword, hword_part, word WITH unaccent, french_stem;

-- Testa os lexemas gerados
SELECT to_tsvector('french', 'il était une fois'); -- Usa config original
-- Resultado: 'fois':4

SELECT to_tsvector('fr', 'il était une fois');     -- Usa config nova
-- Resultado: 'etait':2 'fois':4

SELECT to_tsvector('french', unaccent('il était une fois'));
-- Resultado: 'etait':2 'fois':4


