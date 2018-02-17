require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

task :setup do
  p "Creating databases with preloaded tables"

  ['chitter', 'chitter_test'].each do |db|
    connection = PG.connect
    connection.exec("CREATE DATABASE #{db};")

    connection = PG.connect(dbname: db)
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep VARCHAR(240));") 
    connection.exec("CREATE TABLE users(id SERIAL PRIMARY KEY references peeps(id), user VARCHAR(60));")

    p "Created #{db}"
  end
end

task :setup_test_db do
  connection = PG.connect(dbname: 'chitter_test')

  connection.exec('TRUNCATE peeps RESTART IDENTITY')
  # connection.exec('TRUNCATE users RESTART IDENTITY')

  # At the moment, just filling-in Test DB with peeps info, no users yet
  connection.exec("INSERT INTO peeps (peep) VALUES('¡Día de partido! ¡Vamos Real, hasta el final!');")
  connection.exec("INSERT INTO peeps (peep) VALUES('El bicho scores a hattrick!');")
end

task :clear_db do
  ['chitter', 'chitter_test'].each do |db|
    connection = PG.connect
    connection.exec("DROP DATABASE #{db};")
    p "Deleted #{db}"
  end
end
