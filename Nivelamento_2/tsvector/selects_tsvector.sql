-- Versão corrigida com JOINs e GROUP BY corretos
SELECT 
    to_tsvector(post.language::regconfig, post.title) ||
    to_tsvector(post.language::regconfig, post.content) ||
    to_tsvector('simple', author.name) ||
    to_tsvector('simple', coalesce(string_agg(tag.name, ' '))) AS document
FROM post
JOIN author ON author.id = post.author_id

-- JOIN posts_tags ON posts_tags.post_id = posts_tags.tag_id  -- JOIN incorreto entre posts_tags e tag: junção da tabela com ela mesma
-- JOIN corrigido entre posts_tags e post
JOIN posts_tags ON posts_tags.post_id = post.id

-- JOIN incorreto entre tag e author
-- JOIN tag ON author.id = post.author_id  -- Totalmente errado: junção sem relação lógica

-- JOIN corrigido entre posts_tags e tag
JOIN tag ON tag.id = posts_tags.tag_id

--GROUP BY usando alias não definido
--GROUP BY p.id  -- 'p' nunca foi definido como alias

-- GROUP BY com referências corretas
GROUP BY post.id, author.id;



-- SELECT 
--   to_tsvector(post.language, post.title) ||
--   to_tsvector(post.language, post.content) ||
--   to_tsvector('simple', author.name) ||
--   to_tsvector('simple', coalesce(string_agg(tag.name, ' ')))
-- FROM post
-- JOIN author ON author.id = post.author_id
-- JOIN posts_tags ON posts_tags.post_id = post.id
-- JOIN tag ON tag.id = posts_tags.tag_id
-- GROUP BY post.id, author.id;


-- SELECT pid, p_title
-- FROM (
--   SELECT 
--     post.id AS pid,
--     post.title AS p_title,
--     to_tsvector(post.title) ||
--     to_tsvector(post.content) ||
--     to_tsvector(author.name) ||
--     to_tsvector(coalesce(string_agg(tag.name, ' '), '')) AS document
--   FROM post
--     JOIN author ON author.id = post.author_id
--     JOIN posts_tags ON posts_tags.post_id = post.id
--     JOIN tag ON tag.id = posts_tags.tag_id
--   GROUP BY post.id, author.name
-- ) p_search
-- WHERE p_search.document @@ to_tsquery('Endangered & Species');
