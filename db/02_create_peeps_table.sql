CREATE TABLE peeps(id SERIAL PRIMARY KEY, message_content VARCHAR(60), maker_id INTEGER REFERENCES makers (id));
