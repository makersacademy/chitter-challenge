class Tag
  attr_reader :tag_id, :content

  def initialize(tag_id:, content:)
    @tag_id = tag_id
    @content = content
  end

  def self.create(content:)
    result = DatabaseConnection.query(
      "INSERT INTO tags (content) VALUES($1) RETURNING tag_id, content;", 
      [content])
    Tag.new(tag_id: result[0]['tag_id'], content: result[0]['content'])
  end
end
