if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  require 'pg'
  
  task :db_setup do
    connection = PG.connect(dbname: 'chitter_test')
    connection.exec("CREATE TABLE peeps(id SERIAL PRIMARY KEY, peep TEXT);")
    connection.exec("ALTER TABLE peeps ADD COLUMN time TEXT;")
  end
end
