-- adds a new column that contains the time of the peep created

ALTER TABLE messages ADD COLUMN created_at TIME;

-- for both databases