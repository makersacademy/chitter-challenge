require_relative 'db_connection'

class Post

  attr_reader :id, :body, :creation_date, :user_id

  def initialize(id, body, creation_date, user_id)
    @id = id
    @body = body
    @creation_date = creation_date
    @user_id = user_id
  end


  def self.all
    posts_array = []
    response = DatabaseConnection.query("SELECT * FROM posts")
    response.each do |post|
      posts_array << Post.new(post['id'], post['body'], post['creation_date'], post['user_id'])
    end
    posts_array
  end

  def self.add(body, user_id)
    DatabaseConnection.query("INSERT INTO posts (body, user_id) VALUES ('#{body}', '#{user_id}')")
  end

  def self.find(id)
    post = DatabaseConnection.query("SELECT * FROM posts WHERE id = #{id}")
    Post.new(post[0]['id'], post[0]['body'], post[0]['creation_date'], post[0]['user_id'])
  end


end
