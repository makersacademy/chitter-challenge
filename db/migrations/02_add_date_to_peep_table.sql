ALTER TABLE peeps ADD COLUMN posted_datetime TIMESTAMP;
ALTER TABLE peeps ALTER COLUMN posted_datetime SET DEFAULT localtimestamp;
