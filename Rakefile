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

    begin
      connection.exec("CREATE DATABASE #{db};")
      p "Created #{db}"
    rescue
    end

    connection = PG.connect(dbname: db)

    # We have to create the users table before the other as peeps has a reference to users
    connection.exec("CREATE TABLE IF NOT EXISTS users(id SERIAL PRIMARY KEY, peeper VARCHAR(60), username VARCHAR(60), email VARCHAR(60), password VARCHAR(80));")
    connection.exec("CREATE TABLE IF NOT EXISTS peeps(id SERIAL PRIMARY KEY, peep VARCHAR(240), user_id SERIAL REFERENCES users(id));")
  end
end

task :setup_test_db do
  connection = PG.connect(dbname: 'chitter_test')

  begin
    connection.exec('TRUNCATE peeps RESTART IDENTITY')
    connection.exec('TRUNCATE users RESTART IDENTITY CASCADE')
  rescue
  end

  connection.exec("INSERT INTO users (peeper, username, email, password) VALUES('Bonito', 'DelNorte', 'bonitomail@example.es', 'bonitapass');")
  connection.exec("INSERT INTO peeps (peep, user_id) VALUES('¡Día de partido! ¡Vamos Real, hasta el final!', 1);")
  connection.exec("INSERT INTO peeps (peep, user_id) VALUES('El bicho scores a hattrick!', 1);")
end

task :clear_db do
  ['chitter', 'chitter_test'].each do |db|
    connection = PG.connect
    connection.exec("DROP DATABASE #{db};")
    p "Deleted #{db}"
  end
end
