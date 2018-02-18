if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end


require 'pg'

task :setup do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{database};")
    connection = PG.connect(dbname: database)
    connection.exec('CREATE TABLE peeps (message VARCHAR(140), message_time TIMESTAMP default NOW());')
    p "Created #{database} with peeps"
  end
  # ['users', 'users_test'].each do |database|
  #   connection = PG.connect
  #   connection.exec("CREATE DATABASE #{database};")
  #   connection = PG.connect(dbname: database)
  #   connection.exec('CREATE TABLE users (full_name VARCHAR(30), username VARCHAR(20), email VARCHAR(60), password VARCHAR(20));')
  #   p "Created #{database} with users"
  # end
end

task :setup_test_database do
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('TRUNCATE peeps;')

  connection.exec("INSERT INTO peeps VALUES('My first peep!');")
  connection.exec("INSERT INTO peeps VALUES('My second peep!');")
  connection.exec("INSERT INTO peeps VALUES('My third peep!');")

  # connection = PG.connect(dbname: 'users_test')
  #
  # connection.exec('TRUNCATE users;')
  #
  # connection.exec("INSERT INTO users VALUES('Heather Stock', '@heather', 'heather@imail.com', 'password');")
end

task :remove_database do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database};")
    p "Deleted #{database}"
  end
  # ['users', 'users_test'].each do |database|
  #   connection = PG.connect
  #   connection.exec("DROP DATABASE #{database};")
  #   p "Deleted #{database}"
  # end
end
