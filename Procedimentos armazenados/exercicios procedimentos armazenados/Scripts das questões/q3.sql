CREATE OR REPLACE FUNCTION inserir_disciplina(novo_codigo varchar(10), novo_nome varchar(50), nova_descricao text)
-- A o procedimento armazenado 'inserir_disciplina' recebe três parâmetros: o código, o nome e a descrição da nova disciplina
RETURNS VOID AS
-- O procedimento armazenado não retorna nenhum valor, por isso seu tipo de retorno é VOID
$$
BEGIN
--Select 1 veriica se existe pelo menos um registro que satisfaça a condição especificada
    IF EXISTS (SELECT 1 FROM disciplinas WHERE codigo = novo_codigo OR nome = novo_nome) THEN
        -- Verifica se já existe uma disciplina com o mesmo código ou nome na tabela
        RAISE EXCEPTION 'Código ou nome da disciplina já existem na tabela!';
        -- Se sim, levanta uma exceção com a mensagem especificada
    END IF;
    
    INSERT INTO disciplinas (codigo, nome, descricao) VALUES (novo_codigo, novo_nome, nova_descricao);
    -- Se não houver disciplina com o mesmo código ou nome na tabela, insere a nova disciplina na tabela 'disciplinas'
END;
$$
LANGUAGE plpgsql;
-- Define a linguagem do procedimento armazenado como plpgsql

--Para chamar o procedimento armazenado, basta utilizar o comando select (nome do procedimento armazenado) (parâmetros). Ex.: select inserir_disciplina ('MD', 'Matemática Discreta', 'Disciplina sobre fundamentos matemáticos para a ciência da computação.');

--Para ver os procedimentos armazenados disponíveis é necessário utilizar o seguinte comando: SELECT * FROM pg_catalog.pg_proc WHERE pronamespace = (SELECT oid FROM pg_catalog.pg_namespace WHERE nspname = 'public');

