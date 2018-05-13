require 'pg'

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'chitter_test')

  connection.exec("TRUNCATE peeps;")

  connection.exec("INSERT INTO peeps VALUES(1, 'Test peep 1', '2018-05-11 10:05:20');")
  connection.exec("INSERT INTO peeps VALUES(2, 'Test peep 2', '2018-05-11 20:24:00');")
  connection.exec("INSERT INTO peeps VALUES(3, 'Test peep 3', '2018-05-11 12:19:05');")

end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, message VARCHAR(280), time TIMESTAMP);")
  end
end

task :empty do
  p 'Removing existing databases...'
  %w[chitter chitter_test].each do |database|
    connection = PG.connect(dbname: 'postgres')
    connection.exec("DROP DATABASE #{database};")
  end
end
