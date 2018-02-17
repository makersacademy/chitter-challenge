require "./lib/database_connection"

class Peep

  attr_reader :id, :text

  def initialize(id, text)
    @id = id
    @text = text
  end

  def self.all
    db = DatabaseConnection.query("SELECT * FROM peeps")
    db.map { |peep| Peep.new(peep['id'], peep['text']) }
  end

  def self.create(text)
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{text}')")
  end

end
