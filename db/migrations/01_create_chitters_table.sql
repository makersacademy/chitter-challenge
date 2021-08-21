# in migration/01_create_chitters_table.sql
CREATE TABLE bookmarks(id SERIAL PRIMARY KEY, peep VARCHAR(160));

# same table in chitter_manager_test and chitter_manager db's

# altered table to adda  created_at column which will have the time stamp
ALTER TABLE chitters ADD COLUMN created_on TIMESTAMP DEFAULT NOW();
# then set the column to null
UPDATE chitters SET created_at = NULL;