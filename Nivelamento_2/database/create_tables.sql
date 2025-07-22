CREATE TABLE IF NOT EXISTS author(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS post(
  id SERIAL PRIMARY KEY,
  title TEXT NOT NULL,
  content TEXT NOT NULL,
  author_id INTEGER REFERENCES author(id)
);

CREATE TABLE IF NOT EXISTS tag(
  id SERIAL PRIMARY KEY,
  name TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS posts_tags(
  post_id INT NOT NULL references post(id),
  tag_id INT NOT NULL references tag(id)
 );