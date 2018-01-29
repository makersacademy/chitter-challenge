require 'data_mapper'
require './app/app.rb'

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

namespace :db do

  desc "harmless upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete - data was not lost'
  end

  desc "harmful upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete - data was erased'
  end

  desc "empty test files"
  task :clean_test do
    ENV['RACK_ENV'] = 'test'
    DataMapper.auto_migrate!
    puts 'Auto-migrate of test file complete - data was erased'
  end

end
