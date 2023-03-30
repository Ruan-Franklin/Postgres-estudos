# Exercícios de Gatilhos

1. Escreva um comando para alterar a tabela authors incluindo o campo cpf do tipo varchar com
capacidade para armazenar um numero de CPF (11 dígitos).
2. Crie uma função escalar que receba como parâmetro um valor de CPF e valide os dígitos
verificadores do CPF (os 2 últimos) retornando se está validado ou não.
3. Crie um gatilho associados à tabela authors para quando houver inclusão na tabela validar o
CPF permitindo a inclusão quando o mesmo for válido e cancelando se não for.
4. Crie um comando para inserir um autor e atribua CPF válidos e inválidos para testar. Observe
que o campo au_id tem uma restrição (Constraint) que estabelece um formato a ser obedecido
no ato da inclusão.
