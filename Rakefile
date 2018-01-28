require 'pg'

namespace :setup do
  desc "Set up all databases"
  task :databases do
    puts 'Setting up databases...'
    conn = PG.connect(dbname: 'postgres')
    
    conn.exec('CREATE database chitter_development')
    puts 'Development database setup'

    conn.exec('CREATE database chitter_test')
    puts 'Test database setup'
  end
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
