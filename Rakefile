if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  namespace :db do

    desc "Non-destructive update"
    task :auto_upgrade do
      DataMapper.auto_upgrade!
    end

    desc "Destructive migrate"
    task :auto_migrate do
      DataMapper.auto_migrate!
    end

  end

end
