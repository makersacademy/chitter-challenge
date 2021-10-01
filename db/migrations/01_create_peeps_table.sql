CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(240), created_at timestamp with time zone DEFAULT now());
ALTER TABLE peeps ADD COLUMN user_id INTEGER;  
ALTER TABLE peeps ADD CONSTRAINT fk_user FOREIGN KEY (user_id) REFERENCES users(id);