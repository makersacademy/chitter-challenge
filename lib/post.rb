class Post
  extend DbConnection
  attr_reader :id, :message, :user_id, :created_at

  def initialize(id:, message:, user_id:, created_at:)
    @id = id
    @message = message
    @user_id = user_id
    @created_at = Time.parse(created_at)
  end

  def self.all
    connection.exec("SELECT * FROM posts;").to_a.map do |post|
      Post.new(id: post['id'], message: post['message'], user_id: post['user_id'], created_at: post['created_at'])
    end
  end

  def self.create(user_id:, message:)
    result = connection.exec("INSERT INTO posts (message, user_id) VALUES('#{message}', '#{user_id}') RETURNING user_id, message, id, created_at")
    Post.new(id: result[0]['id'], message: result[0]['message'], user_id: result[0]['user_id'], created_at: result[0]['created_at'])
  end

  def self.delete(id)
    connection.exec("DELETE FROM posts WHERE id = #{id};")
  end

  def author
    User.find(@user_id)
  end
end
