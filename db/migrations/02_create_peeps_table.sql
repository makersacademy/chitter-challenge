CREATE TABLE peeps(
    id SERIAL PRIMARY KEY,
    message VARCHAR(120) NOT NULL,
    username VARCHAR(120) NOT NULL,
    created_at TIMESTAMP WITH TIME ZONE NOT NULL,
    CONSTRAINT fk_username
      FOREIGN KEY(username)
	  REFERENCES users(username)
);