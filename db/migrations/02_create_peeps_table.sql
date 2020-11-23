CREATE TABLE peeps(
    peep_id SERIAL PRIMARY KEY,
    created_at TIMESTAMPTZ DEFAULT Now(),
    script VARCHAR(140),
    account_id INT NOT NULL,
    CONSTRAINT fk_account FOREIGN KEY (account_id)
    REFERENCES accounts(account_id)
);
