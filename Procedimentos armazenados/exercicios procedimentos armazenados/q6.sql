/*
Crie um procedimento armazenado que retorne em um parâmetro de saída o nome da disciplina cujo professor contenha a letra "S" em seu nome. Apresentar os comandos para acionar o procedimento e mostrar o nome do professor.

*/

CREATE OR REPLACE PROCEDURE buscar_disciplina_por_nome_professor(
    IN nome_professor character varying(50), 
    OUT nome_disciplina character varying(50)
)
AS $$
DECLARE
    disciplina character varying(50);
BEGIN
    SELECT d.nome INTO disciplina
    FROM disciplinas d
    INNER JOIN professores_disciplinas pd ON pd.disciplina_id = d.id
    INNER JOIN professores p ON pd.professor_id = p.id
    WHERE p.nome LIKE '%' || 'S' || '%' AND p.nome = nome_professor;
    
    nome_disciplina := disciplina;
END;
$$ LANGUAGE plpgsql;

