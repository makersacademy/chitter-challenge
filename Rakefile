require 'pg'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

task :test_database_setup do
  conn = PG.connect(dbname: 'chitter_test')
  conn.exec "TRUNCATE TABLE users, messages RESTART IDENTITY;"
end
