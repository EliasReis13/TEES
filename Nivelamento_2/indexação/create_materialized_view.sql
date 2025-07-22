-- ERRO NO CÓDIGO ORIGINAL:
-- JOIN posts_tags ON posts_tags.post_id = posts_tags.tag_id está errado.
-- Correto: posts_tags.post_id = post.id
-- Comentamos o erro e corrigimos

-- Visão materializada com documento desnormalizado
-- Permite consultas mais simples e rápidas, ideal quando pode haver atraso na atualização

CREATE MATERIALIZED VIEW search_index AS
SELECT 
  post.id,
  post.title,
  setweight(to_tsvector(post.language::regconfig, post.title), 'A') ||
  setweight(to_tsvector(post.language::regconfig, post.content), 'B') ||
  setweight(to_tsvector('simple', author.name), 'C') ||
  setweight(to_tsvector('simple', coalesce(string_agg(tag.name, ' '))), 'A') AS document
FROM post
JOIN author ON author.id = post.author_id
JOIN posts_tags ON posts_tags.post_id = post.id  -- Correção aqui
JOIN tag ON tag.id = posts_tags.tag_id
GROUP BY post.id, author.id;
