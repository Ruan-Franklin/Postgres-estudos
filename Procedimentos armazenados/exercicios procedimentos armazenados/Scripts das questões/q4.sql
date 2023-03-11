/*
4. Crie um procedimento armazenado para apagar as disciplinas que não tenham descrição. Apresente os comandos utilizados para executar este procedimento.*/

CREATE OR REPLACE PROCEDURE apagar_disciplinas_sem_descricao AS $$
BEGIN
 DELETE FROM disciplinas where descricao IS NULL or descricao = '';
END;

$$ LANGUAGE plpgsql;
