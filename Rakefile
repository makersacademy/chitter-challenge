require 'cucumber/rake/task'
require 'rspec/core/rake_task'
require 'rubocop/rake_task'
require 'data_mapper'

RuboCop::RakeTask.new :cop
RSpec::Core::RakeTask.new :spec
Cucumber::Rake::Task.new :cuke

task default: [:cop, :spec, :cuke]

# task :auto_upgrade do
#   DataMapper.auto_upgrade!
#   puts 'auto_upgrade complete (no data loss)'
# end

# task :auto_migrate do
#   DataMapper.auto_migrate!
#   puts 'auto_migrate complete (data could have been lost)'
# end