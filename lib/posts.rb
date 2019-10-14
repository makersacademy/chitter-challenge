require 'pg'
require_relative './database_connection'

class Posts

  attr_reader :id, :content, :date, :user_id

  def initialize(id:, content:, date:, user_id:)
    @id = id
    @content = content
    @date = date
    @user_id = user_id
  end

  def self.all
    result = DatabaseConnection.query("SELECT * FROM posts ORDER BY id DESC;")
    result.map do |post|
      Posts.new(id: post['id'], content: post['content'], date: post['date'], user_id: post['user_id'])
    end
  end

  def self.create(content:, user_id:)
    result = DatabaseConnection.query("INSERT INTO posts (content, user_id) VALUES('#{content}', '#{user_id}') RETURNING id, content, date, user_id;")
    Posts.new(id: result[0]['id'], content: result[0]['content'], date: result[0]['date'], user_id: result[0]['user_id'])
  end

  def get_user(user = Users)
    user.username(id: @user_id)
  end
end
