-- Exemplo de rank ajustado pela idade do documento (promove publicações mais recentes)
-- Requer que a tabela `post` tenha um campo `created_at`
-- Explicação: Relacionamento entre tabelas posts_tags e post incorreto.

ALTER TABLE post
ADD COLUMN created_at TIMESTAMP DEFAULT NOW();

SELECT pid, p_title,
       ts_rank(document, to_tsquery('english', 'endangered & species')) / (EXTRACT(EPOCH FROM (now() - created_at)) + 1) as ranking
FROM (
  SELECT post.id as pid,
         post.title as p_title,
         post.created_at,
         setweight(to_tsvector(post.language::regconfig, post.title), 'A') ||
         setweight(to_tsvector(post.language::regconfig, post.content), 'B') ||
         setweight(to_tsvector('simple', author.name), 'C') ||
         setweight(to_tsvector('simple', coalesce(string_agg(tag.name, ' '))), 'B') as document
  FROM post
  JOIN author ON author.id = post.author_id
  -- JOIN posts_tags ON posts_tags.post_id = posts_tags.tag_id
  JOIN posts_tags ON posts_tags.post_id = post.id
  JOIN tag ON tag.id = posts_tags.tag_id
  GROUP BY post.id, author.id
) p_search
ORDER BY ranking DESC;


