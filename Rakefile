if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

end

require 'data_mapper'
require './app/chitter.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "auto-upgrade complete"
  end

  desc "Destructive upgrade"
  task :migrate do
    DataMapper.auto_migrate!
    puts "auto-migrate complete"
  end
end
