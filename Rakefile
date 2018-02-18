if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  task :setup do
    p 'Setting up databases...'
    ['chitter', 'chitter_test'].each do |db|
      con = PG.connect
      con.exec("CREATE DATABASE #{db}")
      con = PG.connect dbname: db
      con.exec("CREATE TABLE peeps (id SERIAL PRIMARY KEY, peep VARCHAR(120))")
    end
  end

  task :wipe do 
    p 'Cleaning test databases...'
    ['chitter', 'chitter_test'].each do |db|
      con = PG.connect dbname: db
      con.exec("DROP TABLE IF EXISTS peeps")
    end
  end
end
