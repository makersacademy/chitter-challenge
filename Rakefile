require 'data_mapper'
require 'dm-postgres-adapter'
require_relative 'app/models/tag'
require_relative 'app/models/link'


namespace :db do
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"

  end

  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

end
