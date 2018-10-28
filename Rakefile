if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

task :build_chitter_database do
  ['chitter', 'chitter_test'].each do |db|
    connection = PG.connect(dbname:'postgres')
    connection.exec("CREATE DATABASE #{db};")

    connection = PG.connect(dbname: db)
    connection.exec("CREATE TABLE users (
      id SERIAL PRIMARY KEY,
      name VARCHAR(60),
      username VARCHAR(60),
      email VARCHAR(60),
      password VARCHAR(140)
      );"
    )
    connection.exec("INSERT INTO users (
      id, name)
      VALUES ('1', 'anonymous');"
    )
    connection.exec("CREATE TABLE peeps (
      id SERIAL PRIMARY KEY,
      text VARCHAR(100),
      time TIME,
      date DATE,
      user_id INT REFERENCES users (id)
      );"
    )
  end
end

task :clear_test_database do
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec("TRUNCATE TABLE peeps, users;")

  connection.exec("INSERT INTO users (
    id, name)
    VALUES ('1', 'anonymous');")
end
