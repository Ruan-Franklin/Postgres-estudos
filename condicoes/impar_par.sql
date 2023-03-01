DO $$
DECLARE
   num integer := 5;
BEGIN
   IF num % 2 = 0 THEN
      RAISE NOTICE 'O número % é par', num;
   ELSE
      RAISE NOTICE 'O número % é ímpar', num;
   END IF;
END $$;

/*
Explicando o código:

Estamos declarando uma variável chamada num e atribuindo o valor 5 a ela;
Em seguida, estamos utilizando a estrutura condicional if. A condição que estamos testando é se o resto da divisão de num por 2 é igual a 0. Se essa condição for verdadeira, então num é par e exibimos uma mensagem indicando isso. Caso contrário, num é ímpar e exibimos uma mensagem indicando isso.
O resultado será a exibição da mensagem "O número 5 é ímpar" no console.

Assim funciona o if simples em SQL!

*/
