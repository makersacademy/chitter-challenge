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
    connection.exec('CREATE TABLE peeps (username VARCHAR(20), message VARCHAR(140));')
    p "Created #{database} with peeps"
  end
end

task :setup_test_database do
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('TRUNCATE TABLE peeps;')

  connection.exec("INSERT INTO peeps VALUES('Heather', 'My first peep!');")
  # connection.exec("INSERT INTO links VALUES(2, 'http://www.google.com', 'Google');")
  # connection.exec("INSERT INTO links VALUES(3, 'http://www.facebook.com', 'Facebook');")
end

task :remove_database do
  ['chitter', 'chitter_test'].each do |database|
    connection = PG.connect
    connection.exec("DROP DATABASE #{database};")
    p "Deleted #{database}"
  end
end
