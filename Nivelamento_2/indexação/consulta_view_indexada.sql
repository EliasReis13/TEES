-- ERRO NO CÓDIGO ORIGINAL:
-- ts_rank(p_search.document, ...) não funciona pois `p_search` não existe neste escopo.
-- p_search.document não existe. p_search era o alias em outro contexto (subquery); aqui não há alias definido.

-- SELECT id as post_id, title
-- FROM search_index
-- WHERE document @@ to_tsquery('english', 'Endangered & Species')
-- ORDER BY ts_rank(p_search.document, to_tsquery('english', 'Endangered & Species')) DESC;

-- Correto: usar diretamente o alias do campo `document` que já existe na view

-- Criar índice sobre o campo da visão
CREATE INDEX idx_fts_search ON search_index USING gin(document);

-- Consulta eficiente usando a visão materializada indexada
SELECT id AS post_id, title
FROM search_index
WHERE document @@ to_tsquery('english', 'Endangered & Species')
ORDER BY ts_rank(document, to_tsquery('english', 'Endangered & Species')) DESC;
