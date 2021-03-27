require_relative '../lib/db'

def setup_test_db
  DB.query("DROP TABLE IF EXISTS message_user_tag;")
  DB.query("DROP TABLE IF EXISTS messages;")
  DB.query("DROP TABLE IF EXISTS users;")
  DB.query("CREATE TABLE users (id SERIAL PRIMARY KEY, email VARCHAR(60) UNIQUE, password VARCHAR(140), name VARCHAR(200), username VARCHAR(100) UNIQUE);")
  DB.query("CREATE TABLE messages (id SERIAL PRIMARY KEY, content VARCHAR(2000), user_id INTEGER REFERENCES users(id) ON DELETE CASCADE, created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP);")
  DB.query("CREATE TABLE message_user_tag (id SERIAL PRIMARY KEY, message_id INTEGER REFERENCES messages(id) ON DELETE CASCADE, user_id INTEGER REFERENCES users(id) ON DELETE CASCADE);")
  DB.query("CREATE OR REPLACE VIEW view_messages AS SELECT m.*, u.name, u.username FROM messages m LEFT JOIN users u ON m.user_id = u.id;")
end
