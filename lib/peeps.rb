require_relative 'peep'
require 'pg'

class Peeps

  def self.all(peeps_class = Peep, connection = connect)
    all_peeps = connection.exec("SELECT * FROM peeps;")
    all_peeps.map { |peep| peeps_class.new(peep['name'], peep['username'], peep['time'], peep['text']) }
  end

  def self.peep(name, username, time, text, connection = connect)
    connection.exec("INSERT INTO peeps(name, username, time, text) VALUES('#{name}', '#{username}', '#{time}', '#{text}')")
  end

  def self.name(username, connection = connect)
    name = connection.exec("SELECT * FROM users WHERE username = '#{username}'")
    name.map { |user| return user['name'] }
  end

  private_class_method

  def self.connect
    if ENV['RACK_ENV'] == 'test'
      PG.connect :dbname => 'chitter_test'
    else
      PG.connect :dbname => 'chitter'
    end
  end
end
