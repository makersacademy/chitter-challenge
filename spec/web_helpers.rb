# File for any scripts which need to be run repeatedly as setup
# for the feature tests

def setup_tables
connection = PG.connect(dbname: 'chittertest')
connection.exec('DROP TABLE IF EXISTS users;')
connection.exec('DROP TABLE IF EXISTS peeps;')
connection.exec(
  'CREATE TABLE peeps (id SERIAL PRIMARY KEY, date DATE, time TIME, username VARCHAR(20), post VARCHAR(140));'
)
connection.exec(
  'CREATE TABLE users (id SERIAL PRIMARY KEY, datetime TIMESTAMP, first_name VARCHAR(20), last_name VARCHAR(20), username VARCHAR(20), password VARCHAR(60));'
)
connection.exec("INSERT INTO peeps(date, time, username, post) VALUES('2019-12-02', '10:00:00', 'test@test.com', 'Hello World');")
connection.exec("INSERT INTO users(datetime, first_name, last_name, username, password) VALUES('2019-12-02 10:46:19.500063', 'Test', 'User', 'test@test.com', '2');")
end
