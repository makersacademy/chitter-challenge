require 'pg'
require_relative './chitter_connection'

class Peep

  attr_reader :id, :time, :name, :username, :peep

  def initialize(id, time, name, username, peep)
    @id = id
    @time = time
    @name = name
    @username = username
    @peep = peep
  end

  def self.channel
    channel = ChitterConnection.query("SELECT * FROM peeps ORDER BY time DESC;")
    channel.map { |peep| Peep.new(peep['id'], peep['time'], peep['name'], peep['username'], peep['peep']) }
  end

  def self.new_peep(username, peep)
    time = Peep.current_time
    name = ChitterConnection.query("SELECT name FROM accounts WHERE username='#{username}'")
    ChitterConnection.query("INSERT INTO peeps(time, name, username, peep) VALUES('#{time}', '#{name.first['name']}', '#{username}', '#{peep}')")
  end

  private
  def self.current_time
  time = Time.new
  time.strftime("%d-%m-%Y %H:%M:%S")
  end
end
