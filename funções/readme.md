# Funções em PostgreSQL

A linguagem SQL disponibilizar diferentes tipos de funções. Os procedimentos armazenados, por exemplo, são um tipo de função definida pelo usuário. Além desse tipo de função, é possível encontrar funções agregaadas (funções padrões do SQL), funções escalares e funções de tabela

### Funções escalares

Funções escalares são aquelas que operam em único valor de entrada e produzem um único valor de saída. Por exemplo, a função `UPPER` converte uma string em maiúsculas e retorna a string convertida como resultado. Segue abaixo alguns exemplos de funções escalares no PostgreSQL:

- `UPPER(string)`: Converte uma string em maiúsculas
- `LOWER(string)`: Converte uma string em minúsculas
- `LENGTH(string)`: Retorna o comprimento de uma string
- `ROUND(value, decimal_places)`: Arredonda um número para um número especificado de casas decimais
- `TRIM(string)`: Remove os espaços em branco no início e no final de uma string
- `NOM()`: Retorna a data e hora atuais
- `DATE_PART('part',data)`: Retorna a parte especificada (como ano, mês, dia, hora, minuto, etc.) de uma data.

Exemplo de função escalar para somar dois números em PostgresSQL:

```
CREATE OR REPLACE function soma(int A, int B)
RETURNS int AS $$
BEGIN
  RETURN A+B;
END;
$$ LANGUAGE plpgsql;
```
Para utilizar essa função, basta digitar o comando: `select soma(1,2)`
ou então utilizar em uma consulta de uma tabela:

` SELECT * FROM tabela WHERE (coluna 1, coluna 2) > 10 ;`

Isso retornará todas as linhas de tabela onde a soma das colunas "coluna1" e "coluna2" é maior que 10.

### Funções de tabela

Funções de tabela são funções que retornam um conjunto de linhas como resultado. Essas funções podem ser usadas para encapsular consultas SQL complexas em uma única chamada de função, tornando mais fácil a reutilização de código e a manutenção de consultas complexas. As funções de tabela podem ser definidas como retornando um conjunto de valores, usando a sintaxe `RETURNS TABLE`, ou como uma tabela temporária usando `RETURNS SETOF`. Além disso, as funções de tabela podem ser usadas em um conjunto de outras claúsulas SQL, como `JOIN`, `WHERE`e `GROUP BY`.

Exemplos de funções de tabela:

```
CREATE FUNCTION get_authors_by_city(city_name text) 
RETURNS TABLE (author_id int, author_name text, city text) AS $$
BEGIN
    RETURN QUERY SELECT authors.au_id, authors.au_name, authors.city
    FROM authors
    WHERE authors.city = city_name;
END;
$$ LANGUAGE plpgsql;
```

Essa função recebe como parâmetro o nome de uma cidade e retorna uma tabela com os autores que moram na cidade informada

2. Função da tabela com parâmetros opcionais:

```
CREATE FUNCTION get_sales_by_title(title_id text, start_date date DEFAULT NULL, end_date date DEFAULT NULL) 
RETURNS TABLE (title_id text, total_sales numeric) AS $$
BEGIN
    RETURN QUERY SELECT sales.title_id, sum(sales.qty) * titles.price
    FROM sales
    JOIN titles ON sales.title_id = titles.title_id
    WHERE sales.title_id = COALESCE(title_id, sales.title_id)
    AND sales.ord_date BETWEEN COALESCE(start_date, sales.ord_date) AND COALESCE(end_date, sales.ord_date)
    GROUP BY sales.title_id, titles.price;
END;
$$ LANGUAGE plpgsql;
```

Essa função recebe como parâmetro o ID de um título, uma data de início e uma data de fim (opcionais) e retorna uma tabela com o ID do título e o total de vendas nesse período. Se nenhum período informado, a função retorna as vendas totais do título informado.

3. Função da tabela de múltiplos retornos:

```
CREATE FUNCTION get_author_and_title_info() 
RETURNS TABLE (au_id text, au_name text, title_id text, title text) AS $$
BEGIN
    RETURN QUERY SELECT authors.au_id, authors.au_name, titles.title_id, titles.title
    FROM authors
    JOIN titleauthor ON authors.au_id = titleauthor.au_id
    JOIN titles ON titleauthor.title_id = titles.title_id;
END;
$$ LANGUAGE plpgsql;
```
Essa função retorna uma tabela com o ID e nome do autor e o ID e o título do livro em que o autor participou.

