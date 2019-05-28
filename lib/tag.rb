# TODO:
# Extract regex matching to a differnt class

class Tag
  attr_reader :tag_id, :content

  def initialize(tag_id:, content:)
    @tag_id = tag_id
    @content = content
  end

  def self.create(tag_id:, content:)
    sql = "INSERT INTO tags (tag_id, content) VALUES ('#{tag_id}', '#{content}') RETURNING tag_id, content"
    result = DatabaseConnection.query(sql).first
    Tag.new(tag_id: result['tag_id'], content: result['content'])
  end

  def self.find_id(tag_id:)
    sql = "SELECT * FROM tags WHERE tag_id = #{tag_id} "
    result = DatabaseConnection.query(sql).first
    Tag.new(tag_id: result['id'], content: result['content'])
  end

  def self.find_content(content:)
    
   
    regex = /@\w+/
    match = regex.match(content)

    if match
      result = content.scan(regex).map { |tag| tag.sub('@', "") }

      tag1 = result[0]
    
      sql = "SELECT * FROM tags WHERE content = '#{tag1}' "

      result = DatabaseConnection.query(sql).first

      
      Tag.new(tag_id: result['tag_id'], content: result['content'])
    end

  end
end
