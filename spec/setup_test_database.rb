def setup_test_database
  p "Setting up test database...#{self}"
  connection = PG.connect(dbname: 'chitterbase_test')
  connection.exec('DROP TABLE peeps;')
  connection.exec('DROP TABLE users;')

  connection.exec('CREATE TABLE peeps (id SERIAL PRIMARY KEY, message VARCHAR(280));')
  connection.exec('ALTER TABLE peeps ADD COLUMN created_at TIMESTAMP;')
  connection.exec('ALTER TABLE peeps ALTER COLUMN created_at SET DEFAULT now();')

  connection.exec('CREATE TABLE users (
    id SERIAL PRIMARY KEY,
    name varchar(20),
    username varchar(20),
    password varchar(20),
    email varchar(20)
  );')

  connection.exec('ALTER TABLE peeps ADD COLUMN user_id INTEGER REFERENCES peeps (id);')
end


