require 'pg'

task :test_database_setup do
  p "setting up the databse ready for testing..."
  connection = PG.connect(dbname: "chitter_test")
  connection.exec("TRUNCATE peeps, users;")
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
