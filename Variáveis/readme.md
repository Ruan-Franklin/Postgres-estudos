# Declaração de variáveis no Postgres

´´´
DECLARE nome_da_variavel tipo_da_variavel := valor_da_variavel;
´´´

* A declaração começa com a palavra-chave DECLARE, seguida pelo nome da variável que será criada e o tipo de dado que ela irá armazenar. É possível também atribuir um valor inicial à variável, utilizando o operador :=.


Exemplo: 

´´´ DECLARE contador integer :=0; ´´´

Neste exemplo, estamos declarando uma variável chamada contador, do tipo integer, e atribuindo o valor 0 a ela.

Depois de declarar a variável, é possível utilizá-la em outras instruções SQL do bloco ou função em que ela foi criada. Para alterar o valor da variável, basta atribuir um novo valor a ela utilizando novamente o operador :=.

´´´ contador := contador +1; ´´´

Neste exemplo, estamos incrementando o valor da variável contador em 1.

Lembre-se de que as variáveis criadas dentro de um bloco de código ou função têm escopo local, ou seja, só podem ser utilizadas dentro desse contexto.          
