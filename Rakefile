require 'data_mapper'
require './app/app.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do

  desc "no destructive upgrade"
  task :auto_update do
    DataMapper.auto_upgrade!
  end

  desc "destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
  end

end
