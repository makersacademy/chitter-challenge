require 'standalone_migrations'
require 'rspec/core/rake_task'

StandaloneMigrations::Tasks.load_tasks
RSpec::Core::RakeTask.new :spec
task default: [:spec]
