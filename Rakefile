# if ENV['RACK_ENV'] != 'production'
  require 'pg'
  require 'rspec/core/rake_task'

  # RSpec::Core::RakeTask.new :spec
  
  # task default: [:spec]

  task :setup_test_db do
    p "setting up test database..."

    connection = PG.connect(dbname: 'chitter_test')
    # Clear the table
    connection.exec("TRUNCATE peeps;")
  end

  # call from command line to set up databases:  $> rake setup
  task :setup do
    p "Creating databases..."

    ['chitter', 'chitter_test'].each do |database|
      connection = PG.connect
      connection.exec("DROP DATABASE IF EXISTS #{database};")
      connection.exec("CREATE DATABASE #{database};")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE IF NOT EXISTS peeps (
        id SERIAL PRIMARY KEY, time TIMESTAMP, message VARCHAR(200));")
    end
    # ^refactor of:
    # connection = PG.connect
    # connection.exec("CREATE DATABASE [IF NOT EXISTS] chitter;")
    # connection.exec("CREATE DATABASE [IF NOT EXISTS] chitter_test;")

    # connection = PG.connect(dbname: 'chitter')
    # connection.exec("CREATE TABLE [IF NOT EXISTS] links(
      # id SERIAL PRIMARY KEY, url VARCHAR(60));")

    # connection = PG.connect(dbname: 'chitter_test')
    # connection.exec("CREATE TABLE [IF NOT EXISTS] links(
      # id SERIAL PRIMARY KEY, url VARCHAR(60));")
  end
# end
