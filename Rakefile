if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :setup do
  p "Creating databases..."

  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec(
      "CREATE TABLE users(
      id SERIAL PRIMARY KEY,
      email VARCHAR(60),
      password VARCHAR(140),
      user_name VARCHAR(80)
      );"
    )
    connection.exec(
      "CREATE TABLE posts(
      id SERIAL PRIMARY KEY,
      user_id INTEGER REFERENCES users (id),
      message VARCHAR(240),
      created_at TIMESTAMP DEFAULT now()
      );"
    )
  end
end

task :travis_setup do
  p "Creating test database..."
  connection = PG.connect(dbname: 'chitter_test')
  connection.exec(
    "CREATE TABLE users(
    id SERIAL PRIMARY KEY,
    email VARCHAR(60),
    password VARCHAR(140),
    user_name VARCHAR(80)
    );"
  )
  connection.exec(
    "CREATE TABLE posts(
    id SERIAL PRIMARY KEY,
    user_id INTEGER REFERENCES users (id),
    message VARCHAR(240),
    created_at TIMESTAMP DEFAULT now());"
  )
end
