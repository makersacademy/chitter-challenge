<<<<<<< HEAD
require 'data_mapper'
require_relative './app/app'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end


namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete (no data loss)'
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete (data was lost)'
  end
end
=======
if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end
>>>>>>> 1ec1413865ab4e5dd0990904025289af31194cc3
