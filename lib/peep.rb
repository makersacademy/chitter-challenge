require_relative './database_connection_setup.rb'

class Peep
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end

  def self.create(opt)
    DatabaseConnection.query("INSERT INTO peeps (message) VALUES('#{opt[:message]}')")
  end
end
