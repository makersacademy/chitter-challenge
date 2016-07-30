if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'data_mapper'
require './app/data_mapper_setup'

task :auto_upgrade do
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end
