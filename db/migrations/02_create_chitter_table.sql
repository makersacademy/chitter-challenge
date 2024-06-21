CREATE TABLE chitter(
   chitter_id SERIAL PRIMARY KEY,
   user_id INT,
   peep VARCHAR(255) NOT NULL,
   DATE TIMESTAMP,
   CONSTRAINT fk_user_chitter
      FOREIGN KEY(user_id)
      REFERENCES user_chitter(id)
);
