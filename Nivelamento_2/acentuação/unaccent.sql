-- Ativa a extensão unaccent (executar uma vez por banco)
CREATE EXTENSION IF NOT EXISTS unaccent;

-- Exemplo básico
SELECT unaccent('èéêë');  -- Resultado: 'eeee'
