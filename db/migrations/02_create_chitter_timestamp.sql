ALTER TABLE peeps_timeline ADD COLUMN created_at TIMESTAMP DEFAULT NOW()
UPDATE mytable SET created_at = NULL
