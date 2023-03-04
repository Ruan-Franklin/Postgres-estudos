CREATE OR REPLACE FUNCTION listar_disciplinas_por_nome()
-- Define a função "listar_disciplinas_por_nome" que retorna uma tabela com as colunas da tabela "disciplinas"
RETURNS TABLE(codigo character varying(10), nome character varying(50)) AS $$
-- Define o início do bloco de código do procedimento armazenado
BEGIN
  -- Retorna a consulta das colunas "codigo" e "nome" da tabela "disciplinas", ordenadas pelo nome
  RETURN QUERY SELECT codigo, nome
  FROM disciplinas
  ORDER BY nome;
-- Define o fim do bloco de código do procedimento armazenado
END;
$$ LANGUAGE plpgsql;

--Para executar esse procedimento armazenado, basta usar o seguinte comando: SELECT * FROM listar_disciplinas_por_nome();
