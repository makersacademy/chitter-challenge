require_relative './database_connection_setup.rb'

class Peep
  attr_reader :ts, :message

  def initialize(ts, message)
    @ts = ts
    @message = message
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(peep['ts'], peep['message']) }
  end

  def self.create(opt)
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{opt[:message]}')")
  end
end
