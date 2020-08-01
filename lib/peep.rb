require_relative 'database_connection'

class Peep

  def self.all
    DatabaseConnection.setup("chitter_test")
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| peep['text'] }
  end
end
