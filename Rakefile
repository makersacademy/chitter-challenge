if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'pg'
  require 'data_mapper'
  require 'dm-postgres-adapter'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :setup do
    puts "Creating databases..."
    ['chitter_development', 'chitter_test'].each do |database|
      con = PG.connect
      con.exec("CREATE DATABASE #{database}")
      PG.connect dbname: database
    end
  end
end
