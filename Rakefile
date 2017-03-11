require 'data_mapper'
require './app/app.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

# This part is not yet working. Will implement later on in the project.

 # namespace :db do
 #   desc "Non destructive upgrade"
 #   task :auto_upgrade do
 #     DataMapper.auto_upgrade!
 #     puts "Auto-upgrade complete"
 #   end
 #
 #   desc "Destructive upgrade"
 #   task :auto_migrate do
 #     DataMapper.auto_migrate!
 #     puts "Auto-migrate complete (old data lost)"
 #   end
 # end
