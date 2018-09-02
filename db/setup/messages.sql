CREATE TABLE IF NOT EXISTS messages (
	id INTEGER PRIMARY KEY,
	body TEXT,
	created_at DATETIME,
	user_id INTEGER
);
