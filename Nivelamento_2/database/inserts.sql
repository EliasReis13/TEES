INSERT INTO author (id, name) VALUES 
  (1, 'Pete Graham'),
  (2, 'Rachid Belaid'),
  (3, 'Robert Berry');

INSERT INTO tag (id, name) VALUES
 (1, 'scifi'),
  (2, 'politics'),
  (3, 'science');

INSERT INTO post (id, title, content, author_id) VALUES 
  (1, 'Endangered species', 'Pandas are an endangered species', 1 ),
  (2, 'Freedom of Speech', 'Freedom of speech is a necessary right', 2),
  (3, 'Star Wars vs Star Trek', 'Few words from a big fan', 3);

INSERT INTO posts_tags (post_id, tag_id) VALUES
  (1, 3),
  (2, 2),
  (3, 1);