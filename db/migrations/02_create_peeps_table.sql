# created a table within the database:
CREATE TABLE peeps(
    peep_id SERIAL PRIMARY KEY,
    created_on DATE
    created_at TIME,
    script VARCHAR(140),
    account_id INT NOT NULL,
    CONSTRAINT fk_account FOREIGN KEY (account_id)
    REFERENCES account(account_id)
);
