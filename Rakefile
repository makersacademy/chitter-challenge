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

  desc 'Database Setup'
  task :setup do
    sh('psql -c "CREATE DATABASE chitter_test;"')
    sh('psql -c "CREATE DATABASE chitter_development;"')
    puts 'Database Environment Configured'
  end
end
