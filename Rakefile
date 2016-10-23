require 'data_mapper'
require './app/server'
require 'rubocop/rake_task'

begin
  require 'rspec/core/rake_task'

  RuboCop::RakeTask.new(:cop)
  RSpec::Core::RakeTask.new(:spec)
rescue LoadError
end

task default: [:cop, :spec]

task :env do
  puts Sinatra::Application.environment
end

namespace :db do

  desc "Non destructive upgrade"
    task :auto_upgrade do
      # auto_upgrade makes non-destructive changes.
      # If your tables don't exist, they will be created
      # but if they do and you changed your schema
      # (e.g. changed the type of one of the properties)
      # they will not be upgraded because that would lead to data loss.
      DataMapper.auto_upgrade!
      puts 'Auto-upgrade complete (no data loss)'
  end

  desc "Destructive upgrade"

    task :auto_migrate do
      # To force the creation of all tables as they are
      # described in your models, even if this
      # may lead to data loss, use auto_migrate:
      DataMapper.auto_migrate!
      puts 'Auto-migrate complete (data could have been lost)'
    end
    # Finally, don't forget that before you do any of that stuff,
    # you need to create a database first.
end
