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

    vannio = User.create(
      username: "vannio",
      name: "Van",
      email: "van@email.com",
      password: "password123",
      password_confirm: "password123"
    )

    edballs = User.create(
      username: "edballs",
      name: "Ed Balls",
      email: "ed@email.com",
      password: "password123",
      password_confirm: "password123"
    )

    jaden = User.create(
      username: "officialjaden",
      name: "Jaden Smith",
      email: "j@email.com",
      password: "password123",
      password_confirm: "password123"
    )

    makers = User.create(
      username: "makersacademy",
      name: "Makers Academy",
      email: "makers@email.com",
      password: "password123",
      password_confirm: "password123"
    )

    Peep.create(
      text: "You would have to eat 5 apples today to get the same nutritional value as an apple from 1950",
      timestamp: Time.now - (60 * 60 * 24.2 * 10),
      user: jaden
    )

    Peep.create(
      text: "If a cup cake falls from a tree, how far away will it be from down?",
      timestamp: Time.now - (60 * 60 * 22.3 * 9),
      user: jaden
    )

    Peep.create(
      text: "Ed Balls",
      timestamp: Time.now - (60 * 60 * 21.5 * 8),
      user: edballs
    )

    Peep.create(
      text: "Hah, @edballs is so silly",
      timestamp: Time.now - (60 * 60 * 20 * 8),
      user: vannio
    )

    Peep.create(
      text: "If everybody in the world dropped out of school, we would have a much more intelligent society",
      timestamp: Time.now - (60 * 60 * 21.1 * 7),
      user: jaden
    )

    Peep.create(
      text: "You can discover everything you need to know about everything by looking at your hands",
      timestamp: Time.now - (60 * 60 * 20.7 * 6),
      user: jaden
    )

    Peep.create(
      text: "If a book store never runs out of a certain book, does that mean that nobody reads it, or everybody reads it",
      timestamp: Time.now - (60 * 60 * 19.3 * 5),
      user: jaden
    )

    Peep.create(
      text: "How can mirrors be real if our eyes aren't real",
      timestamp: Time.now - (60 * 60 * 5.3 * 3),
      user: jaden
    )

    Peep.create(
      text: "@vannio How did you make such an awesome twitter clone?",
      timestamp: Time.now - (60 * 60 * 23.4),
      user: makers
    )

    Peep.create(
      text: "If newborn babies could speak, they would be the most intelligent beings on planet earth",
      timestamp: Time.now - (60 * 60 * 18.7),
      user: jaden
    )


    Peep.create(
      text: "@makers Let's see.. I used Sinatra, DataMapper, Postgres, Rspec, Capybara and some other stuff I couldn't fit into 140 chars",
      timestamp: Time.now - (60 * 60 * 3),
      user: vannio
    )

    puts "Auto-migrate and seed complete (data was lost)"
  end
end
