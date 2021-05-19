CREATE TABLE peeps (
    id SERIAL PRIMARY KEY,
    username varchar(22) NOT NULL UNIQUE,
    message varchar(255),
    created TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);

INSERT INTO peeps (username, message)
VALUES ('Stu', 'hello');