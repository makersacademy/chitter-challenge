require './server'

task :before do
  raise "RAKE_ENV has not been specified" unless ENV.has_key?('RACK_ENV')
end

task :test do
  require 'cucumber/rake/task'
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'

  RuboCop::RakeTask.new
  RSpec::Core::RakeTask.new
  Cucumber::Rake::Task.new
end



task :default do

end
