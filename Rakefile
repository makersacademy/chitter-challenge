require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'

require_relative './app/models/peep'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec

task default: [:cop, :spec]

task :auto_upgrade do
  DataMapper.setup(:default, "postgres://localhost/chitter_test")
  DataMapper.finalize
  DataMapper.auto_upgrade!
  puts 'Auto-upgrade complete (no data loss)'
end

task :auto_migrate do
  DataMapper.setup(:default, "postgres://localhost/chitter_test")
  DataMapper.finalize
  DataMapper.auto_migrate!
  puts 'Auto-migrate complete (data could have been lost)'
end