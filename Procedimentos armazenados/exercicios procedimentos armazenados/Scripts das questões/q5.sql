/*
Crie um procedimento armazenado para listar as disciplinas do professor com maior quantidade de disciplinas lecionadas. Apresente a listagem incluindo, o nome do professor e o nome das disciplinas.

*/

CREATE OR REPLACE PROCEDURE listar_disciplinas_professor_mais_lecionadas() 
LANGUAGE plpgsql
AS $$
DECLARE
    professor_id INTEGER;
BEGIN
    -- Seleciona o professor com mais disciplinas lecionadas
    SELECT pd.professor_id
    INTO professor_id
    FROM professores_disciplinas pd
    GROUP BY pd.professor_id
    ORDER BY COUNT(*) DESC
    LIMIT 1;
    
    -- Lista as disciplinas do professor selecionado
    SELECT d.nome, d.descricao
    FROM disciplinas d
    INNER JOIN professores_disciplinas pd ON pd.disciplina_id = d.id
    WHERE pd.professor_id = listar_disciplinas_professor_mais_lecionadas.professor_id;
END;
$$;

