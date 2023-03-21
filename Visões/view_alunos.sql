/*

VIEW para listar todos os alunos que possuem a letra "a" no nome, em qualquer posição.

*/

CREATE VIEW VW_alunos_a
AS
SELECT * FROM alunos where nome LIKE '%a%'
;

-- O comando select * from VW_alunos_a aciona a VIEW.


