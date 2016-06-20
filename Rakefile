if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'data_mapper'
require_relative 'app.rb'

namespace :db do
  desc 'Non-destructive database upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Database upgraded! No data loss!'
  end

  desc 'Destructive database migration'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Database migrated! Data loss!'
  end
end
