if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

namespace :db do
  task :create do
    system 'createdb chitter_test'
    system 'createdb chitter_development'
  end
end
