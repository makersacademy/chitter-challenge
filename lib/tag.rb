require_relative './database_connection'

class Tag
  def self.create(content:)
    result = DatabaseConnection.query(
      "INSERT INTO tags (content) VALUES($1) RETURNING id, content;", [content]
    )
    Tag.new(id: result[0]['id'], content: result[0]['content'])
  end

  def self.where(peep_id:)
    result = DatabaseConnection.query(
      "SELECT id, content FROM peeps_tags INNER JOIN tags ON tags.id = peeps_tags.tag_id WHERE peeps_tags.peep_id = $1;",
      [peep_id]
    )
    result.map do |tag|
      Tag.new(id: tag['id'], content: tag['content'])
    end
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end
end