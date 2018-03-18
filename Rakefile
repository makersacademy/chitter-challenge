if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'pg'

task :setup do
  p "Creating databases..."

  ['blahblah', 'blahblah_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database}")

    connection = PG.connect(dbname: database)

    connection.exec("CREATE TABLE blahs (
                      id SERIAL PRIMARY KEY,
                      username VARCHAR(10),
                      blah VARCHAR(140),
                      date TIMESTAMP DEFAULT now()
                    );")

    connection.exec("CREATE TABLE users (
                      id SERIAL PRIMARY KEY,
                      name VARCHAR(60),
                      username VARCHAR(10) NOT NULL,
                      email VARCHAR(60) NOT NULL,
                      password VARCHAR(140)
                    );")

    p "Created database: #{database}"
  end
end

task :test_database_setup do
  p "Cleaning database..."

  connection = PG.connect(dbname: 'blahblah_test')

  connection.exec("TRUNCATE blahs")
  connection.exec("TRUNCATE users")

  ## TODO Reset counters
  connection.exec(
    "INSERT INTO blahs(username, blah, date)
      VALUES (
        'TestUser',
        'One blah',
        '2015-10-19 10:23:54'
      );"
    )

  connection.exec(
    "INSERT INTO blahs(username, blah, date)
      VALUES (
        'TestUser',
        'Two blah',
        '2016-10-19 10:23:54'
      );"
    )

  connection.exec(
    "INSERT INTO blahs(username, blah, date)
      VALUES (
        'TestUser',
        'Three blah',
        '2017-10-19 10:23:54'
      );"
    )

  connection.exec(
    "INSERT INTO users(name, username, email, password)
      VALUES (
        'Test User',
        'TestUser',
        'testuser@test.com',
        'password'
      );"
  )

  p "Databases populated"
end

task :teardown do
  p "Destroying blahblah databases"
  p "type 'y' to continue"

  confirm = STDIN.gets.chomp
  return unless confirm == 'y'

  ['blahblah', 'blahblah_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database}")

    p "Completed destroying database: #{database}"
  end
end
