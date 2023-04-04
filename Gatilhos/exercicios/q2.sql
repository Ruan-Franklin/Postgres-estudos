/* Crie uma função escalar que receba como parâmetro um valor de CPF e valide os dígitos verificadores do CPF (os 2 últimos) retornando se está validado ou não.
*/

-- Criando a função valida_cpf com um parâmetro de entrada
CREATE OR REPLACE FUNCTION valida_cpf(cpf_in VARCHAR)
RETURNS BOOLEAN AS $$
DECLARE
  cpf VARCHAR(11);
  i INTEGER;
  soma1 INTEGER;
  soma2 INTEGER;
  dv1 INTEGER;
  dv2 INTEGER;
BEGIN
  -- Remove todos os caracteres que não são dígitos
  cpf := regexp_replace(cpf_in, '[^0-9]', '', 'g');
  
  -- Verifica se o CPF tem 11 dígitos
  IF length(cpf) <> 11 THEN
    RETURN FALSE;
  END IF;
  
  -- Calcula o primeiro dígito verificador
  soma1 := 0;
  FOR i IN 1..9 LOOP
    soma1 := soma1 + (substring(cpf, i, 1)::INTEGER * (11 - i));
  END LOOP;
  dv1 := (11 - (soma1 % 11)) % 10;
  
  -- Calcula o segundo dígito verificador
  soma2 := 0;
  FOR i IN 1..10 LOOP
    soma2 := soma2 + (substring(cpf, i, 1)::INTEGER * (12 - i));
  END LOOP;
  dv2 := (11 - (soma2 % 11)) % 10;
  
  -- Verifica se os dígitos verificadores são iguais aos do CPF informado
  IF (substring(cpf, 10, 1)::INTEGER <> dv1) OR (substring(cpf, 11, 1)::INTEGER <> dv2) THEN
    RETURN FALSE;
  END IF;
  
  -- Se tudo estiver correto, retorna verdadeiro
  RETURN TRUE;
END;
$$ LANGUAGE plpgsql;


--Para testar, basta fazer uma consulta select com a função, por exemplo: SELECT validar_cpf('037.543.720-58'); 

