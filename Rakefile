if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'app/app.rb'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
