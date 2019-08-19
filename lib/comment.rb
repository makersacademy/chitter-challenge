class Comment
  def self.create(post_id:, text:)
    result = DatabaseConnection.query("INSERT INTO comments (post_id, text) VALUES ('#{post_id}','#{text}') RETURNING id, text, post_id;")
    Comment.new(
      id: result[0]['id'],
      text: result[0]['text'],
      post_id: result[0]['post_id']
    )
  end

  def self.delete(id:)
   result = DatabaseConnection.query("DELETE FROM comments WHERE id = #{id};")
  end

  attr_reader :id, :text, :post_id

  def initialize(id:, text:, post_id:)
    @id = id
    @text = text
    @post_id = post_id
  end

  def self.where(post_id:)
  result = DatabaseConnection.query("SELECT * FROM comments WHERE post_id = #{post_id};")
  result.map do |comment|
    Comment.new(
      id: comment['id'],
      text: comment['text'],
      post_id: comment['post_id']
    )
    end
  end

end
