require "./config/data_mapper"

namespace "db" do
  desc "Truncates tables"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Migrated successfully"
  end

  desc "Updates tables (safely)"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Upgraded successfully"
  end
end
