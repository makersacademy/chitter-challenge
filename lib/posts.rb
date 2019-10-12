require 'pg'

class Posts

  attr_reader :id, :content

  def initialize(id:, content:)
    @id = id
    @content = content
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM posts;")
    result.map do |post|
      Posts.new(id: post['id'], content: post['content'])
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO posts (content) VALUES('#{content}') RETURNING id, content;")
    Posts.new(id: result[0]['id'], content: result[0]['content'])
  end

end
