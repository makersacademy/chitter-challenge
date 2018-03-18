require 'pg'
require_relative 'database_connection'

class Peep

  attr_reader :id, :username, :message, :time

  def initialize(id, username, message, time)
    @id = id
    @username = username
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(
      peep['id'],
      peep['username'],
      peep['message'],
      peep['time']
      )
    }
  end

  def self.create(peep)
    DatabaseConnection.query(
      "INSERT INTO peeps (username, message, time) VALUES (
        '#{peep[:username]}',
        '#{peep[:message]}',
        '#{(Time.now + 1 * 60 * 60).strftime('%r')}'
        )")
  end
end
