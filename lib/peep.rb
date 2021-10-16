class Peep
  attr_reader :content
  def initialize(content: nil)
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM peeps")

    result.map do |peep| 
      Peep.new(content: peep['content'])
    end

  end

  def self.create(content: )
    DatabaseConnection.query("INSERT INTO peeps(content) VALUES ($1)", [content])
  end

end