require_relative './database_connection_setup'

class Peep
  attr_reader :message, :time, :author
  def initialize(message, time, author = "anon.")
    @message = message
    @time = time
    @author = author
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['message'], peep['time'], peep['author']) }
  end
end
