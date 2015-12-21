require 'data_mapper'
require './app/app.rb'

# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#
#   RSpec::Core::RakeTask.new :spec
#
#   task default: [:spec]
# end


task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts "auto-upgrade complete (no data loss)"
end

task :auto_migrate do
  DataMapper.auto_migrate!
  puts "auto-upgrade complete (data was lost)"
end
