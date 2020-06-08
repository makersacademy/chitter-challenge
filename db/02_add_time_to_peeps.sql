ALTER TABLE peep_manager ADD COLUMN created_at TIMESTAMP DEFAULT NOW();
UPDATE peep_manager SET created_at = NULL