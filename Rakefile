if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  task :test_database_setup do
    p "Cleaning database"

    connection = PG.connect(dbname: 'peep_test')
    connection.exec("TRUNCATE peeps;")
  end

  task :setup do
    p 'Creating databases...'

    ['peep', 'peep_test'].each do |database|
      connection = PG.connect
      connection.exec("CREATE DATABASE #{database};")
      connection = PG.connect(dbname: database)
      connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, content VARCHAR(140), date timestamp);")
    end
  end
end
