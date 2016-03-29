require 'data_mapper'
require './app/app.rb'



namespace :db do
  desc "Non destructive upgrade"
  task :upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data lost)"
  end

desc "Destructive upgrade"
  task :migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

  desc "Test Env Destructive upgrade"
    task :tenv_migrate do
      DataMapper.setup(:default, "postgres://localhost/chitter_tests")
      DataMapper.auto_migrate!
      puts "Auto-migrate complete (data was lost)"
    end

desc "Migrate all"
  task :mal do
    Rake::Task["db:migrate"].invoke
    Rake::Task["db:tenv_migrate"].invoke
  end
end

if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end
