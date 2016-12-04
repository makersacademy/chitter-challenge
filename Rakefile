# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#
#   RSpec::Core::RakeTask.new :spec
#
#   task default: [:spec]
# end
#





require 'data_mapper'
require './app/app.rb'

namespace :db do

  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Autoupgrade complete, no data loss"
  end

  desc "Destrutive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Automigrate complete, data was lost"
  end

end
