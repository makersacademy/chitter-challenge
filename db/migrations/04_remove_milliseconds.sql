ALTER TABLE peeps ALTER COLUMN created_at set default date_trunc('second', current_timestamp);