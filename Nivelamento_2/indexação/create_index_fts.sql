-- Comando original do artigo (potencialmente incompleto se 'language' não for regconfig)
-- CREATE INDEX idx_fts_post ON post
-- USING gin(setweight(to_tsvector(language, title),'A') ||
--    setweight(to_tsvector(language, content), 'B'));
-- Risco de erro se a coluna language não contiver valores válidos de configuração

-- Idioma: Inglês
CREATE INDEX idx_fts_post_fixed_lang ON post
USING gin(
  (
    setweight(to_tsvector('english', title), 'A')
    ||
    setweight(to_tsvector('english', content), 'B')
  )
);


