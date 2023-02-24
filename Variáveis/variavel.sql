-- O comando DO é utilizado para executar uma sequência de comandos SQL.
-- Os símbolos $$ indicam o início e o fim do bloco de código.
-- Neste exemplo, estamos criando um bloco anônimo que não retorna nada, mas que declara uma variável.

DO $$
-- A palavra-chave DECLARE é usada para declarar variáveis.
-- Neste exemplo, estamos declarando uma variável chamada var_id e inicializando-a com o valor 10.
DECLARE
   var_id integer := 10;
BEGIN
   -- O comando RAISE NOTICE é usado para exibir uma mensagem de log.
   -- Aqui, estamos exibindo o valor atual da variável usando a string de formatação %.
   RAISE NOTICE 'O valor da variável é %', var_id;
END $$;

