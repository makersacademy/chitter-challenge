class Peep
  attr_reader :content

  def initialize(content)
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps", [])
    result.map {|peep| Peep.new(peep['content'])}
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO peeps (content) VALUES($1)", [content])
    Peep.new(content)
  end
end