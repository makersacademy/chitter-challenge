require 'pg'

class Peep
  def self.create(content:)
    result = DatabaseConnection.query(
      "INSERT INTO peeps (content) VALUES($1) RETURNING id, content;", [content]
    )
    Peep.new(id: result[0]['id'], content: result[0]['content'])
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end
  
end
