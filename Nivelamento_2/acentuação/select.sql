-- SELECT 
--   to_tsvector(post.language, unaccent(post.title)) ||
SELECT 
  to_tsvector(post.language::regconfig, unaccent(post.title)) ||
  to_tsvector(post.language::regconfig, unaccent(post.content)) ||
  to_tsvector('simple', unaccent(author.name)) ||
  to_tsvector('simple', unaccent(coalesce(string_agg(tag.name, ' '), '')))
FROM post
JOIN author ON author.id = post.author_id
JOIN posts_tags ON posts_tags.post_id = post.id
JOIN tag ON tag.id = posts_tags.tag_id
GROUP BY post.id, author.id;

-- HINT: Nenhuma função corresponde com o nome e os tipos de argumentos informados. Você precisa adicionar conversões de tipo explícitas.
--Esse erro acontece porque o PostgreSQL espera que o primeiro argumento da função to_tsvector seja do tipo regconfig, não um simples texto.