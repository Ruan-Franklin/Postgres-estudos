# Visões

As visões (ou views) são objetos do banco de dados PostgreSQL que representam uma consulta armazenada, ou seja, é uma consulta que é pré-definida e pode ser utilizada posteriormente como uma tabela virtual. Essas visões são criadas a partir de uma ou mais tabelas existentes, bem como de outras visões.

As visões são utéis para diversos fins, tais como:

- Simplificar consultas complexas: quando há uma consulta que envolve muitas tabelas e/ou cálculos complexos, é possível criar uma visão que já realiza a consulta e, posteriormente. acessà-la de forma mais simples.
- Restringir acesso a dados: as visões podem ser utiilzadas para limitar o acesso de usuários ou aplicações a determinados campos ou linhas da tabela original. Por exemplo, é possível criar uma visão que inclui apenas os dados de uma determinada coluna da tabela original, ocultando assim informações sensíveis.

- Reutilização de consultas: visões podem ser utilizadas para facilitar a reutilização  de consultas, permitindo que elas sejam executadas em diferentes contextos e com diferentes parâmetros.

Para criar uma visão, é necessário utilizar a sintaxe a seguir:

```
CREATE [TEMP | TEMPORARY] VIEW nome_da_visao AS consulta;
```

Onde:

- `TEMP` ou `TEMPORARY`: cria uma visão temporária, que é automáticaamente descartada quando a sessão de conexão ao banco de dados é encerrada.

- `nome_da_visao`: nome dado à visão;

- `consulta`: consulta SQL que define a visão

Por exemplo, suponha que temos a seguinte tabela `funcionarios`: 

```
CREATE TABLE funcionarios(
  id SERIAL  PRIMARY KEY,
  nome VARCHAR(50),
  salario NUMERIC(10,2),
  data_contratacao DATE
):
```

Podemos criar uma visão que lista todos os funcionários com salário maior que 5000:

```
CREATE VIEW funcionario_salario_maior_5000 AS
SELECT * FROM funcionarios where salario > 5000;
```

Após a criação da tabela, podemos utilizà-la da mesma forma que utilizamos uma tabela
```
SELECT * FROM funcionarios_salario_maior_5000;
```

É importante ressaltar que as visões  não armazenam dados físicamente, apenas a consulta que define a visão. Quando uma visão é utilizada em uma consuta, a consulta é executada a partir da consulta definida na visão.

Além disso, é possível alterar ou excluir uma visão utilizando as sintaxes `ALTER VIEW` e `DROP VIEW`, respectivamente:

```

--Alterar uma visão

ALTER VIEW nome_da_visao AS nova_consulta;

--excluir uma visão

DROP VIEW nome_da_visao;

```

