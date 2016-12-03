require 'data_mapper'
require './app/app.rb'

namespace :db do
  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete!(data was lost)"
  end
end
