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
    channel = ChitterConnection.query("SELECT * FROM peeps;")
    channel.map { |peep| Peep.new(peep['id'], peep['time'], peep['name'], peep['username'], peep['peep']) }
  end
end
