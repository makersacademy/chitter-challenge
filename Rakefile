task test: [:cop, :spec, :cuke]

task default: `bundle exec rackup`

begin
  require 'cucumber/rake/task'
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  RuboCop::RakeTask.new :cop
  RSpec::Core::RakeTask.new :spec
  Cucumber::Rake::Task.new :cuke
rescue LoadError => e
  puts "Test dependencies could not be loaded"
end

