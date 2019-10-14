require 'pg'

puts "Setting up test database..."

connection = PG.connect(dbname: 'test_database')
puts "Connected to database..."
connection.exec("TRUNCATE chitter;")
puts "Database clear..."
connection.exec("INSERT INTO chitter (peeps) VALUES ('Here are some demo peeps...');
INSERT INTO chitter (peeps) VALUES ('And another');
INSERT INTO chitter (peeps) VALUES ('I can not stop peeping');
INSERT INTO chitter (peeps) VALUES ('This is a Peep from the TEST DB!');
INSERT INTO chitter (peeps) VALUES ('Peep, peep, peep!');")
puts "Database reset with default values..."
