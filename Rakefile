require './app/app.rb'
require 'data_mapper'

# if ENV['RACK_ENV'] != 'production'
#   require 'rspec/core/rake_task'
#
#   RSpec::Core::RakeTask.new :spec
#
#   task default: [:spec]
# end

namespace :db do

  desc 'non-destructive upgrade'
  task :upgrade do
    DataMapper.auto_upgrade!
  end

  desc 'destructive upgrade (terminal data loss)'
  task :migrate do
    DataMapper.auto_migrate!
  end

end
