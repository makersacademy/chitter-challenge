require 'pg'

namespace :setup do
  desc "Set up all databases"
  task :databases do
    puts 'Setting up databases...'
    conn = PG.connect(dbname: 'postgres')

    conn.exec('CREATE database chitter_development')
    puts 'Development database setup'

    conn.exec('CREATE database chitter_test')
    puts 'Test database setup'
  end
end

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts 'Auto-upgrade complete (no data loss)'
  end


  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts 'Auto-migrate complete (data was lost)'
  end
end
