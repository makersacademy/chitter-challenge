require "./lib/database_connection"

class Peep

  attr_reader :id, :text, :time

  def initialize(id, text, time)
    @id = id
    @text = text
    @time = time
  end

  def self.all
    db = DatabaseConnection.query("SELECT * FROM peeps")
    db.map { |peep| Peep.new(peep['id'], peep['text'], peep['time']) }
  end

  def self.create(text)
    DatabaseConnection.query("INSERT INTO peeps (text, time) VALUES ('#{text}', '#{Time.now}')")
  end

end
