-- ERROS NO CÓDIGO ORIGINAL:
-- JOIN posts_tags ON posts_tags.post_id = posts_tags.tag_id está incorreto: a cláusula de junção correta é posts_tags.post_id = post.id
-- Na versão incorreta está unindo a tabela posts_tags com ela mesma, o que é logicamente incorreto e leva a resultados errados.

SELECT pid, p_title
FROM (
  SELECT 
    post.id AS pid,
    post.title AS p_title,
    setweight(to_tsvector(post.language::regconfig, post.title), 'A') ||
    setweight(to_tsvector(post.language::regconfig, post.content), 'B') ||
    setweight(to_tsvector('simple', author.name), 'C') ||
    setweight(to_tsvector('simple', coalesce(string_agg(tag.name, ' '))), 'B') AS document
  FROM post
  JOIN author ON author.id = post.author_id
  JOIN posts_tags ON posts_tags.post_id = post.id  -- Correção aqui
  JOIN tag ON tag.id = posts_tags.tag_id
  GROUP BY post.id, author.id
) p_search
WHERE p_search.document @@ to_tsquery('english', 'Endangered & Species')
ORDER BY ts_rank(p_search.document, to_tsquery('english', 'Endangered & Species')) DESC;
