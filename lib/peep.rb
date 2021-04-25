class Peep
  attr_reader :text
  def initialize(args = {})
    @id = args[:id]
    @text = args[:text]
  end

  def self.create(peep)
    DatabaseConnection.query("INSERT INTO peeps (text) VALUES ('#{peep}');")
  end

  def self.list
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(text: peep['text']) }.reverse
  end
end
