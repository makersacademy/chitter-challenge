CREATE TABLE peeps (
   id SERIAL primary key,
   message varchar(255),
   created_at timestamp,
   updated_at timestamp,
   user_id INTEGER REFERENCES users (id)
   );