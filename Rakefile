if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

desc 'Auto Upgrade'
task :auto_upgrade do
  DataMapper.auto_upgrade!
end

desc "Auto Migrate"
task :auto_migrate do
  DataMapper.auto_migrate!
end
