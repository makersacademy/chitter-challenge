if ENV['RACK_ENV'] != 'production'
  require 'rspec/core/rake_task'

  RSpec::Core::RakeTask.new :spec

  task default: [:spec]
end


require 'data_mapper'
require './app/app.rb'

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

    users = [
      { username: "vannio", name: "Van", email: "van@email.com" },
      { username: "edballs", name: "Ed Balls", email: "ed@email.com" },
      { username: "officialjaden", name: "Jaden Smith", email: "j@email.com" },
      { username: "makersacademy", name: "Makers Academy", email: "makers@email.com" },
    ]

    peeps = [
      { text: "You would have to eat 5 apples today to get the same nutritional value as an apple from 1950",
        time_offset: (24.2 * 10),
        username: "officialjaden" },
      { text: "If a cup cake falls from a tree, how far away will it be from down?",
        time_offset: (22.3 * 9),
        username: "officialjaden" },
      { text: "Ed Balls",
        time_offset: (21.5 * 8),
        username: "edballs" },
      { text: "Hah, @edballs is so silly",
        time_offset: (20 * 8),
        username: "vannio" },
      { text: "If everybody in the world dropped out of school, we would have a much more intelligent society",
        time_offset: (21.1 * 7),
        username: "officialjaden" },
      { text: "You can discover everything you need to know about everything by looking at your hands",
        time_offset: (20.7 * 6),
        username: "officialjaden" },
      { text: "If a book store never runs out of a certain book, does that mean that nobody reads it, or everybody reads it",
        time_offset: (19.3 * 5),
        username: "officialjaden" },
      { text: "How can mirrors be real if our eyes aren't real",
        time_offset: (5.3 * 3),
        username: "officialjaden" },
      { text: "@vannio How did you make such an awesome twitter clone?",
        time_offset: (23.4),
        username: "makersacademy" },
      { text: "If newborn babies could speak, they would be the most intelligent beings on planet earth",
        time_offset: (18.7),
        username: "officialjaden" },
      { text: "@makers Let's see.. I used Sinatra, DataMapper, Postgres, Rspec, Capybara and some other stuff I couldn't fit into 140 chars",
        time_offset: (3),
        username: "vannio" },
    ]

    users.each do |user|
      User.create(
        username: user[:username],
        name: user[:name],
        email: user[:email],
        password: "password123",
        password_confirm: "password123"
      )
    end

    peeps.each do |peep|
      Peep.create(
        text: peep[:text],
        timestamp: Time.now - (3600 * peep[:time_offset]),
        user: User.first(username: peep[:username])
      )
    end

    puts "Auto-migrate and seed complete (data was lost)"
  end
end
