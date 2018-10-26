if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

task :test_database_setup do
  connection = PG.connect(dbname: 'peep_manager_test')
  connection.exec('TRUNCATE peeps;')
end
