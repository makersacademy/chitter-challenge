class Peep
  attr_reader :id, :texts

  def initialize(id, texts)
    @id = id
    @texts = texts
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps;")
    result.map do |row| peep = Peep.new(row["id"], row["texts"]) end
  end

  def self.create(texts)
    DatabaseConnection.query("INSERT INTO peeps (texts) VALUES ('#{texts}');")
    # Peep.new(result["id"], result["texts"])
  end

end