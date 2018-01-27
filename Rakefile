if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'data_mapper'
  require_relative './app/app.rb'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

  task :upgrade do
    DataMapper.auto_upgrade!
    p "Datamapper has auto upgraded"
  end

  task :migrate do
    DataMapper.auto_migrate!
    p "Datamapper has auto migrated"
  end

end
