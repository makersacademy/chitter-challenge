require './config/data_mapper'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  desc "auto_upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Upgrade confirmed!"
  end

  desc "auto_migrate"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Migration confirmed!"
  end
end
