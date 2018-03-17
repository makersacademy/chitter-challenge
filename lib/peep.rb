require_relative './database_connection_setup'

class Peep
  attr_reader :message, :time
  def initialize(message, time)
    @message = message
    @time = time
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['message'], peep['time']) }
  end
end
