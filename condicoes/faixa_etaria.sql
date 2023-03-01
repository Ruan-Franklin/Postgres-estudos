/* No Postgres, o equivalente ao 'if' múltiplo é a estrutura 'CASE'. O 'CASE' permite testar múltiplas condições e executar ações diferentes dependendo de cada caso.

A sintaxe básica do case é a seguinte:

CASE 
  WHEN condicao THEN acao1
  WHEN condicao2 THEN acao2
  ...
  ELSE acao_padrao
END;

Cada 'WHEN' testa uma condição e executa uma ação se a condição for verdadeira. A última claúsula 'ELSE' é opcional e especifica uma ação a ser executada se nenhuma das condições for verdadeira.

Aqui está um exemplo de case no Postgres
*/

SELECT nome, idade, 
  CASE 
    WHEN idade < 18 THEN 'Menor de idade'
    WHEN idade >= 18 THEN 'Maior de idade'
  ELSE 'Idoso
END AS Faixa_Etaria

FROM Clientes;
