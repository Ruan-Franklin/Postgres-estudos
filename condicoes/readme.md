# If Simples e If Múltiplo no PostgreSQL

No PostgreSQL, é possível utilizar condicionais para controlar o fluxo de execução do código SQL. As duas principais estruturas de condicionais no PostgreSQL são o IF simples e o IF múltiplo, também conhecido como CASE.

### IF Simples
O IF simples no PostgreSQL é utilizado para avaliar uma condição simples e, caso ela seja verdadeira, executar uma determinada instrução SQL. A sintaxe básica é a seguinte:

```
IF condicao THEN
   instrucao;
END IF;
```

Onde condicao é a condição a ser avaliada e instrucao é a instrução SQL a ser executada caso a condição seja verdadeira. É importante notar que o IF simples é finalizado com a palavra-chave END IF.
Por exemplo, imagine que temos uma tabela chamada Clientes com um campo chamado saldo. Queremos atualizar o saldo do cliente com ID 1 caso o saldo atual seja menor do que 0. Podemos fazer isso utilizando o IF simples:

```
IF (SELECT saldo FROM clientes WHERE id = 1) < 0 THEN
   UPDATE clientes SET saldo = 0 WHERE id = 1;
END IF;
```

Neste exemplo, a condição a ser avaliada é (SELECT saldo FROM clientes WHERE id = 1) < 0, ou seja, se o saldo do cliente com ID 1 for menor do que 0. Caso essa condição seja verdadeira, a instrução SQL UPDATE clientes SET saldo = 0 WHERE id = 1; será executada.

### IF Múltiplo
O IF múltiplo, ou CASE, no PostgreSQL é utilizado para avaliar múltiplas condições e, caso alguma delas seja verdadeira, executar uma determinada instrução SQL. A sintaxe básica é a seguinte:

```
CASE 
   WHEN condicao1 THEN 
      instrucao1;
   WHEN condicao2 THEN 
      instrucao2;
   ...
   ELSE 
      instrucaoN;
END CASE;
```

Onde condicao1, condicao2, etc. são as condições a serem avaliadas e instrucao1, instrucao2, etc. são as instruções SQL a serem executadas caso a respectiva condição seja verdadeira. A instrução SQL ELSE instrucaoN é opcional e é executada caso nenhuma das condições anteriores seja verdadeira.

Por exemplo, imagine que temos uma tabela chamada Pedidos com um campo chamado status. Queremos exibir uma mensagem diferente dependendo do status do pedido. Podemos fazer isso utilizando o IF múltiplo:

```
SELECT 
   CASE 
      WHEN status = 'pendente' THEN 'Seu pedido está pendente de pagamento.';
      WHEN status = 'em andamento' THEN 'Seu pedido está em andamento.';
      WHEN status = 'entregue' THEN 'Seu pedido foi entregue.';
      ELSE 'Status desconhecido.';
   END AS mensagem
FROM pedidos 
WHERE id = 1;
```
Neste exemplo, estamos utilizando o IF múltiplo para avaliar o campo status da tabela Pedidos. Caso o status seja "pendente", "em andamento" ou 'entregue'.
