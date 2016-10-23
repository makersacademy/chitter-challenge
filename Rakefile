if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  require 'rubocop/rake_task'
  require 'data_mapper'
  require 'dm-postgres-adapter'
  
	RuboCop::RakeTask.new
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]

  namespace :db do
  	task :auto_upgrade do
  		puts "Upgrading Database..."
  		DataMapper.auto_upgrade!
  		puts "Completed"
  	end

  	task :auto_migrate do
  		puts "Migrating Database..."
  		DataMapper.auto_migrate!
  		puts "Completed"
  	end
  end

end