if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'
  
  RSpec::Core::RakeTask.new :spec
  
  task default: [:spec]
end

require 'data_mapper'
require '/app/app.rb'

namespace :db do
	task :auto_upgrade do
		desc "Non destructive upgrade"
	  DataMapper.auto_upgrade!
	  puts 'Auto-upgrade complete (no data loss)'
	end

	task :auto_migrate do
		desc "Destructive upgrade"
	  DataMapper.auto_migrate!
	  puts 'Auto-migrate complete (data could have been lost)'
	end

end



