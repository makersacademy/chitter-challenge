begin
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  require 'cucumber/rake/task'

  RuboCop::RakeTask.new :cop
  RSpec::Core::RakeTask.new :spec
  Cucumber::Rake::Task.new :cuke

  task default: [:cop, :spec, :cuke]
  
rescue LoadError
end
