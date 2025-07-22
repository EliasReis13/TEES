-- Habilita a extensão pg_trgm 
CREATE EXTENSION IF NOT EXISTS pg_trgm;

-- Cria a visão materializada com os lexemas únicos dos textos
CREATE MATERIALIZED VIEW unique_lexeme AS
SELECT word FROM ts_stat(
  $$
  SELECT 
    to_tsvector('simple', public.post.title) ||
    to_tsvector('simple', public.post.content) ||
    to_tsvector('simple', public.author.name) ||
    to_tsvector('simple', coalesce(string_agg(public.tag.name, ' '), ''))
  FROM public.post
  JOIN public.author ON public.author.id = public.post.author_id
  JOIN public.posts_tags ON public.posts_tags.post_id = public.post.id
  JOIN public.tag ON public.tag.id = public.posts_tags.tag_id
  GROUP BY public.post.id, public.author.id
  $$
);

-- Cria índice GIN para acelerar consultas por similaridade usando trigram
CREATE INDEX words_idx ON unique_lexeme USING gin(word gin_trgm_ops);


-- SELECT word FROM ts_stat('
--   SELECT 
--     to_tsvector(''simple'', post.title) ||  -- Sem public.
--     to_tsvector(''simple'', post.content) || -- Sem public.
--     to_tsvector(''simple'', author.name) ||  -- Sem public.
--     to_tsvector(''simple'', coalesce(string_agg(tag.name, '' ''), ''''))
--   FROM post  -- Sem public.
--   JOIN author ON author.id = post.author_id  -- Sem public.
--   JOIN posts_tags ON posts_tags.post_id = post.id  -- Sem public.
--   JOIN tag ON tag.id = posts_tags.tag_id  -- Sem public.
--   GROUP BY post.id, author.id  -- Sem public.
-- ');

-- Problema: Faltava o esquema (public.) nas referências de tabelas
-- Isso poderia causar erros se o schema não estivesse no search_path