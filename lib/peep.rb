require_relative './database_connection_setup'

class Peep
  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| peep['message'] }
  end
end
