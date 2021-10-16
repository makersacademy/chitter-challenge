class Peep
  attr_reader :content, :id

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content) VALUES ($1) RETURNING id, content;", [content])
    Peep.new(id: result[0]["id"], content: result[0]['content'])
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")
    result.map { |peep| Peep.new(id: peep["id"], content: peep["content"]) }
  end
end