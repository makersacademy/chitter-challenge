require_relative './database_connection'
require_relative './peep'

class Tag
  def self.create(content:)
    result = DatabaseConnection.query(
      "SELECT * FROM tags WHERE content = $1;", [content]
    ).first
    if !result
      result = DatabaseConnection.query(
        "INSERT INTO tags (content) VALUES($1) RETURNING id, content;", [content]
      ).first
    end
    Tag.new(id: result['id'], content: result['content'])
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

  def self.find(id:)
    result = DatabaseConnection.query("SELECT * FROM tags WHERE id = #{id};")
    Tag.new(id: result[0]['id'], content: result[0]['content'])
  end

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def peeps(peep_class = Peep)
    peep_class.where(tag_id: id)
  end
end