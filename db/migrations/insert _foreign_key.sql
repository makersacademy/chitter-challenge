INSERT INTO peeps (account_id, message) VALUES ((SELECT account_id FROM accounts WHERE account_id=1), 'This is my first peep on Chitter!');
