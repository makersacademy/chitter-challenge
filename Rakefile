require_relative 'app/chitter_app'

task :upgrade do
  DataMapper.auto_upgrade!
  puts "Upgrade completed"
end

task :migrate do
  DataMapper.auto_migrate!
  puts "Migrate completed"
end
