--Define a função listar_disciplinas_professores
CREATE OR REPLACE FUNCTION listar_disciplinas_professores()
--RETURNS TABLE é uma função que retorna uma tabela
RETURNS TABLE (codigo varchar(10), nome varchar(100), qtd_professores integer) AS
$$
BEGIN
--RETURN QUERY permite que um procedimento armazenado retorne um conjunto de linhas gerado a partir de uma instrução select
    RETURN QUERY
    -- Seleciona o código e nome da disciplina, além da quantidade de professores
    -- que lecionam essa disciplina
    SELECT d.codigo, d.nome, CAST(COUNT(pd.id) AS INTEGER) as qtd_professores
    FROM disciplinas d
    INNER JOIN professores_disciplinas pd
    ON d.id = pd.disciplina_id
    GROUP BY d.codigo, d.nome
    ORDER BY d.nome;
END;
$$
LANGUAGE plpgsql;

