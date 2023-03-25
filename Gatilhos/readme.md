# Gatilhos

Em PostgreSQL, os gatilhos (triggers) são procedimentos armazenados que são executados automaticamente em resposta a determinados eventos, como inserção, atualização ou exclusão de dados em uma tabela.

Quando um gatilho é criado em uma tabela, ele é associado a um evento específico (por exemplo, antes ou depois da inserção de uma nova linha na tabela) e é executado automaticamente sempre que esse evento ocorre. Os gatilhos podem ser usados para implementar uma variedade de funcionalidades, como validar dados, manter consistência entre tabelas relacionadas, auditar mudanças de dados, gerar logs e notificações, entre outros.

Os gatilhos em PostgreSQL são criados usando a sintaxe CREATE TRIGGER, que especifica o nome do gatilho, o evento que desencadeia o gatilho, a tabela associada ao gatilho e o nome do gatilho, o evento que desencadeia o gatilho, a tabela ssociada ao gatilho e o código a ser executado quando o gatilho é ativado. O código que o gatilho executa pode ser escrito em uma variedade de linguagens de programação,  como PL/pgSQL/PL/Python, PL/PERL,PL/Java entre outras.

	É importante notar que, embora os gatilhos possam ser úteis em muitos cenários, é preciso tomar cuidado ao usà-los, pois eles podem impactar o desempenho do banco de dados e a conscistência dos dados se não forem usados corretamente.

Os gatilhos são procedimentos armazenados que são acionados automaticamente pelo sistema quando um evento ocorre em uma tabela específica. Eles são definidos para serem executados antes ou depois de uma determinada operação, como INSERT, UPDATE ou DELETE, e podem ser usados para executar ações adicionais, como atualizar outras tabelas, enviar notificações, gerar logs, entre outros. Os gatilhos permitem automatizar tarefas e garantir a integridade e consistência dos dados armazenados no banco de dados.

Exemplo de gatilho:

```
CREATE OR REPLACE FUNCTION atualizar_total_alunos()
RETURNS TRIGGER AS $$
BEGIN
  UPDATE total_alunos SET quantidade = quantidade +1;
  RETURN NEW;
END;
$$ LANGUAGE plpgsql;

CREATE TRIGGER inserir_aluno
AFTER INSERT ON alunos
FOR EACH ROW
EXECUTE FUNCTION atualizar_total_alunos();
```
Neste exemplo, o gatilho é acionado após uma nova linha ser inserida na tabela `alunos`. Ele chama a função `atualizar_total_alunos()`, que por sua vez atualiza a tabela `total_alunos`, incrementando em 1 o valor da coluna `quantidade, note que a claúsula `FOR EACH ROW` indica que o gatilho é executado para cada nova linha inserida na tabela `alunos`,
