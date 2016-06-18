require 'data_mapper'
require 'app/app.rb'

namespace :db do
  desc 'Non-destructive database upgrade'
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Database upgraded! No data loss!'
  end

  desc 'Destructive database migration'
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Database migrated! Data loss!'
  end
end
