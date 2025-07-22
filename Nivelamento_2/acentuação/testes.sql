-- SELECT to_tsvector('french', 'il était une fois'); -- Configuração original Resultado: 'fois':4

-- SELECT to_tsvector('fr', 'il était une fois'); -- Configuração personalizada fr (com unaccent) Resultado: 'etait':2 'fois':4 | mais eficiente quando usada em índices

SELECT to_tsvector('french', unaccent('il était une fois')); -- Usando unaccent manualmente Resultado: 'etait':2 'fois':4
