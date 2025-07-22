
SELECT 
  to_tsvector(post.language::regconfig, unaccent(post.title)) ||
  to_tsvector(post.language::regconfig, unaccent(post.content)) ||
  to_tsvector('simple', unaccent(author.name)) ||
  to_tsvector('simple', unaccent(coalesce(string_agg(tag.name, ' '), '')))
FROM post
JOIN author ON author.id = post.author_id
JOIN posts_tags ON posts_tags.post_id = post.id

-- JOIN tag ON author.id = post.author_id  -- JOIN incorreto
JOIN tag ON tag.id = posts_tags.tag_id

-- GROUP BY p.id  -- p não foi definido como alias
GROUP BY post.id, author.id;

-- ERRO NO CÓDIGO ORIGINAL:
-- GROUP BY p.id está errado: a tabela é post, não p (p não foi usada como alias).
-- JOIN tag ON author.id = post.author_id está errado: deveria ser tag.id = posts_tags.tag_id

