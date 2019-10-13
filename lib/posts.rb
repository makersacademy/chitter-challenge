require 'pg'
require_relative './database_connection'

class Posts

  attr_reader :id, :content, :date

  def initialize(id:, content:, date:)
    @id = id
    @content = content
    @date = date
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM posts ORDER BY id DESC;")
    result.map do |post|
      Posts.new(id: post['id'], content: post['content'], date: post['date'])
    end
  end

  def self.create(content:)
    result = DatabaseConnection.query("INSERT INTO posts (content) VALUES('#{content}') RETURNING id, content, date;")
    Posts.new(id: result[0]['id'], content: result[0]['content'], date: result[0]['date'])
  end

end
