if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end

require 'data_mapper'
require './app/app.rb'
require './data/peeps'
require './data/users'

namespace :db do
  desc "Non destructive upgrade"
  task :auto_upgrade do
    DataMapper.auto_upgrade!
    puts "Auto-upgrade complete (no data loss)"
  end

  desc "Destructive upgrade"
  task :auto_migrate do
    DataMapper.auto_migrate!
    puts "Auto-migrate complete (data was lost)"
  end

  desc "Seed database with data"
  task :seed do
    DataMapper.auto_migrate!

    USERS.each do |user|
      User.create(
        username: user[:username],
        name: user[:name],
        email: user[:email],
        password: "password123",
        password_confirm: "password123"
      )
    end

    PEEPS.each do |peep_data|
      peep = Peep.create(
        text: peep_data[:text],
        timestamp: Time.now - (3600 * peep_data[:time_offset]),
        user: User.first(username: peep_data[:username])
      )
      Peep.extract_hashtags(peep)
    end

    puts "Auto-migrate and seed complete (data was lost)"
  end
end
