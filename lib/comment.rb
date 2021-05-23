class Comment

  attr_reader :id, :text, :chirp_id

  def initialize(id:, text:, chirp_id:)
    @id = id
    @text = text
    @chirp_id = chirp_id
  end

  def self.create(chirp_id:, text:)
    result = DatabaseConnection.query("INSERT INTO comments (chirp_id, text) VALUES ('#{chirp_id}', '#{text}') RETURNING id, text, chirp_id;")
    Comment.new(
      id: result[0]['id'],
      text: result[0]['text'],
      chirp_id: result[0]['chirp_id']
    )
  end

  def self.where(chirp_id:)
    result = DatabaseConnection.query("SELECT * FROM comments WHERE chirp_id = #{chirp_id};")
    result.map do |comment|
      Comment.new(
        id: comment['id'],
        text: comment['text'],
        chirp_id: comment['chirp_id']
      )
    end
  end

  def self.delete(chirp_id:)
    DatabaseConnection.query("DELETE FROM comments WHERE chirp_id = #{chirp_id}")
  end

end