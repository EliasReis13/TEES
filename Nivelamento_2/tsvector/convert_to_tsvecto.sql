SELECT
    to_tsvector(post.title) ||
    to_tsvector(post.content) ||
    to_tsvector(author.name) ||
    to_tsvector(COALESCE(string_agg(tag.name, ', '), '')) AS document
FROM post
    JOIN author ON author.id = post.author_id
    JOIN posts_tags ON posts_tags.post_id = post.id
    JOIN tag ON tag.id = posts_tags.tag_id
GROUP BY post.id, author.name;