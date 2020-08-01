require_relative 'database_connection'

class Peep

  def initialize(text)
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map { |peep| peep['text'] }
  end

  def self.create(text)
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{text}');")
    Peep.new(text)
  end
end
