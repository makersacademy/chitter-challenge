
require 'pg'
require 'rake'

task default: %w(empty setup test_setup)

task :test_setup do
  p 'Cleaning DB...'

  con = PG.connect(dbname: 'chitter_test')

  con.exec('TRUNCATE TABLE peeps;')

  p 'Setting up test environment...'

  con.exec("INSERT INTO peeps (ts, txt) VALUES('2018-03-17 16:01:00', '0th');")
  con.exec("INSERT INTO peeps (ts, txt) VALUES('2018-03-17 16:02:00', '1st');")
  con.exec("INSERT INTO peeps (ts, txt) VALUES('2018-03-17 16:03:00', '2nd');")

end

task :setup do
  p 'Creating DBs...'

  %w[chitter chitter_test].each do |db|
    con = PG.connect(dbname: 'postgres')
    con.exec("CREATE DATABASE #{db};")
    con = PG.connect(dbname: db)
    con.exec('CREATE TABLE peeps(id SERIAL PRIMARY KEY,
      ts TIMESTAMP DEFAULT now(), txt VARCHAR(60));')
  end
end

task :empty do
  p 'Removing existing DBs...'
  %w[chitter chitter_test].each do |db|
    con = PG.connect(dbname: 'postgres')
    con.exec("DROP DATABASE #{db};")
  end
end
