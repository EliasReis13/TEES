-- SELECT to_tsvector('If you can dream it, you can do it') @@ 'dream'; -- true: a palavra "dream" está no texto
-- SELECT to_tsvector('It''s kind of fun to do the impossible') @@ 'impossible'; -- false: "impossible" é transformada para 'imposs' no tsvector, mas não na consulta
-- SELECT to_tsvector('It''s kind of fun to do the impossible') @@ to_tsquery('impossible'); -- true
-- SELECT to_tsvector('facts don''t fit the theory') @@ to_tsquery('!fact'); -- false: o documento contém "fact"
-- SELECT to_tsvector('facts don''t fit the theory') @@ to_tsquery('theory & !fact'); -- false: contém os dois
-- SELECT to_tsvector('facts don''t fit the theory') @@ to_tsquery('fiction | theory'); -- true: contém "theory"
SELECT to_tsvector('facts don''t fit the theory') @@ to_tsquery('theo:*'); -- true: corresponde a "theory"
