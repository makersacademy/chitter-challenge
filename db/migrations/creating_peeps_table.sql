CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    message varchar(255),
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
    userid int FOREIGN KEY REFERENCES users(userid)
);

INSERT INTO peeps (message)
VALUES ('peeps');