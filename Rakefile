require 'data_mapper'
require_relative './app/app.rb'

task default: %w[upgrade]

task :upgrade do
  DataMapper.auto_upgrade!
  p "Datamapper has auto upgraded"
end

task :migrate do
  DataMapper.auto_migrate!
  p "Datamapper has auto migrated"
end
