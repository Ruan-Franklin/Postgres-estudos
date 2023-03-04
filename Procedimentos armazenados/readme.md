# Procedimentos armazenados

No PostgreSQL, procedimentos armazenados são conhecidos como "funções". Uma função é um objeto de banco de dados que executa uma tarefa específica, como realizar um cálculo, executar uma consulta ou atualizar dados em uma tabela. Ela pode receber parâmetros de entrada e retornar valores de saída.

Para criar uma função no Postgres, a seguinte sintaxe pode ser usada:

```
CREATE FUNCTION nome_da_funcao(lista_de_parametros) RETURNS tipo_de_retorno AS $$
DECLARE
  --declaração de variáveis
BEGIN
  --Instruções SQL

END;

$$ LANGUAGE plpgsql;

```

Sobre a sintaxe:

- `CREATE FUNCTION`: Instrui o PostgreSQL a criar uma nova função
- `nome_da_funcao` : o nome que você deseja dar à sua função.
- `lista_de_parametros`: os parâmetros de entrada da função, separados por vírgulas. Cada parâmetro deve ser declarado com um nome e um tipo de dado
- `RETURNS tipo_de_retorno` : especifica o tipo de dado que a função retorna.
- `AS $$`: Inicia o bloco de código da fumção
- `DECLARE`: Indica o início da seção de declaração de variáveis. Aqui, você pode declarar as variáveis que a função usará
-`BEGIN`: inicia a seção de instruções SQL da função.
-`END`: indica o final do bloco de código da função.
- `LANGUAGE plgsql´: específica que o código da função é escrito em PL/pgSQL, a linguagem procedural do PostgreSQL.


Exemplo simples de função que recebe um nome  como parâmetro e retorna uma saudação personalizada:

```
CREATE FUNCTION saudacao(nome text) RETURNS text AS $$
  DECLARE
    mensagem text;
  BEGIN
    mensagem := 'Olá, ' || nome || ' !Bem-vindo(a) ao PostgreSQL.';
    RETURN mensagem;
  END;

 $$ LANGUAGE plpgsql;
```

Você pode chamar a função criada utilizando a seguinte sintaxe:

```
SELECT saudacao('Joao'); --retorna "Olá, João! Bem-vindo ao PostgreSQL."
```

Exemplo de comando para visualizar procedimentos armazenados:

```
SELECT proname, pg_get_function_arguments(oid) AS arguments, pg_get_functiondef(oid) AS definition
FROM pg_proc
WHERE pronamespace = (SELECT oid FROM pg_namespace WHERE nspname = 'tads')
ORDER BY proname;
```
