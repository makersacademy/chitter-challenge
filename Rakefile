require 'data_mapper'
require 'app/app'

namespace :db do
  desc 'DB upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'DB upgraded'
  end

  desc 'DB migrate'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'DB migrated'
  end
end