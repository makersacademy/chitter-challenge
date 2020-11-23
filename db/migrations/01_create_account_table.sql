CREATE TABLE accounts(
    account_id SERIAL PRIMARY KEY,
    forename VARCHAR(20) NOT NULL,
    surname VARCHAR(40) NOT NULL,
    username VARCHAR(20) NOT NULL,
    email VARCHAR(50) NOT NULL,
    password VARCHAR(20)
);
