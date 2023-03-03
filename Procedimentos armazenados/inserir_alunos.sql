CREATE OR REPLACE FUNCTION inserir_aluno(nome_aluno character varying(50), idade_aluno integer, data_nascimento_aluno date, especialidade_aluno character varying(50))
RETURNS void AS
$BODY$
BEGIN
  INSERT INTO Alunos (nome, idade, data_nascimento, especialidade)
  VALUES (nome_aluno, idade_aluno, to_date(data_nascimento_aluno, 'DD/MM/YYYY'), especialidade_aluno);
END;
$BODY$
LANGUAGE plpgsql;

