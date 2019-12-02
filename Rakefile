if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  require 'pg'
  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
