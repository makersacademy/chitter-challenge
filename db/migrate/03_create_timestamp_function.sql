CREATE OR REPLACE FUNCTION trigger_set_timestamp()
 RETURNS trigger
 LANGUAGE plpgsql
AS $function$
BEGIN
  NEW.created_at = NOW();
  RETURN NEW;
END;
$function$

