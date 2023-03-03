DO $$
DECLARE
  contador INTEGER := 1;
BEGIN
  LOOP
    EXIT WHEN contador> 10;
    RAISE NOTICE 'O valor do contador é %', contador;
    contador := contador + 1;
  END LOOP;
END $$;

