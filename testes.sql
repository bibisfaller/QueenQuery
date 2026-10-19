
-- QUEENQUERY - TESTES DE MANIPULAÇÃO DE DADOS
-- Módulo 3 - Banco de Dados e Controle de Versão

PRAGMA foreign_keys = ON;

-- 1. INSERIR UMA CATEGORIA
INSERT OR IGNORE INTO categorias (nome)
VALUES ('HTML e CSS');

-- 2. INSERIR UM REGISTRO TÉCNICO
INSERT INTO registros (
    titulo,
    descricao,
    solucao,
    data_registro,
    id_categoria
)
VALUES (
    'Problema de responsividade',
    'A página não se adapta a telas pequenas',
    'Verificar as media queries do CSS',
    '2026-10-18',
    (SELECT id_categoria
     FROM categorias
     WHERE nome = 'HTML e CSS')
);

-- 3. CONSULTAR REGISTROS E CATEGORIAS
SELECT
    registros.id_registro,
    registros.titulo,
    categorias.nome AS categoria,
    registros.descricao,
    registros.solucao
FROM registros
INNER JOIN categorias
    ON registros.id_categoria = categorias.id_categoria;

-- 4. ATUALIZAR UM REGISTRO
UPDATE registros
SET solucao = 'Ajustar as media queries e testar diferentes tamanhos de tela'
WHERE titulo = 'Problema de responsividade';

-- 5. CONSULTAR O REGISTRO ATUALIZADO
SELECT titulo, solucao
FROM registros
WHERE titulo = 'Problema de responsividade';

-- 6. EXCLUIR O REGISTRO DE TESTE
DELETE FROM registros
WHERE titulo = 'Problema de responsividade';

-- 7. CONFERIR OS REGISTROS RESTANTES
SELECT * FROM registros;
