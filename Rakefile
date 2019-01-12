# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
  
#   RSpec::Core::RakeTask.new :spec
  
#   task default: [:spec]
# end

require "./config/data_mapper"

namespace :db do
  desc "Migrates tables"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Migrated successfully"
  end

  desc "Updates tables"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Upgraded successfully"
  end
end