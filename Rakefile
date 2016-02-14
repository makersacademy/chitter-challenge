require 'data_mapper'
require './app/chitter.rb'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end


  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]

end

# rake -T
# rake db:auto_migrate    # Destructive upgrade
# rake db:auto_upgrade    # Non destructive upgrade
# $ rake db:auto_upgrade RACK_ENV=test
# $ rake db:auto_upgrade # Default RACK_ENV is development so we don't need to be explicit.
# $ heroku run rake db:auto_upgrade # Default RACK_ENV on heroku is 'production'
