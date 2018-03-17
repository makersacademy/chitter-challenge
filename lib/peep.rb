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
    @current_time = current_time
  end

  def self.channel
    channel = ChitterConnection.query("SELECT * FROM peeps;")
    channel.map { |peep| Peep.new(peep['id'], peep['time'], peep['name'], peep['username'], peep['peep']) }
  end

  def self.new_peep(name, username, peep, time = @current_time)
    ChitterConnection.query("INSERT INTO peeps(time, name, username, peep) VALUES('#{time}', '#{name}', '#{username}', '#{peep}')")
  end

  private
  def current_time
  time = Time.new
  time.strftime("%d-%m-%Y %H:%M:%S")
  end
end
