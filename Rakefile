require './app/app.rb'
require 'data_mapper'

task default: %w[upgrade]

namespace :db do

  desc 'non-destructive upgrade'
  task :upgrade do
    DataMapper.auto_upgrade!
  end

  desc 'destructive upgrade (terminal data loss)'
  task :migrate do
    DataMapper.auto_migrate!
  end

end
