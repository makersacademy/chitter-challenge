require 'data_mapper'
require './app/app.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do
  desc "Non destructive upgrade"
    task :upgrade do
      DataMapper.auto_upgrade!
      puts "auto_upgrade complete no data lost"
    end

  desc "Destructive upgrade"
    task :migrate do
      DataMapper.auto_migrate!
      puts "auto_migrate complete data lost"
    end

end
