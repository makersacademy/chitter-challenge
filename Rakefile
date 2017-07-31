require 'data_mapper'
require './app/app.rb'

task default: %w[upgrade]

desc "non descructive upgrade"
task :upgrade do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['database']}")
  DataMapper.auto_upgrade!
  puts "Database upgraded!"
end

desc "descructive upgrade"
task :migrate do
  DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['database']}")
  DataMapper.auto_migrate!
  puts "Database migrated!"
end
