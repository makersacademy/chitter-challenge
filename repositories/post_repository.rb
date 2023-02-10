require_relative '../models/post'
require_relative '../models/post_with_user'

class PostRepository

  def all
    query = <<~SQL
      SELECT * FROM posts
    SQL

    result_set = DatabaseConnection.exec_params(query, [])

    result_set.map do |record|
      record["id"] = record["id"].to_i
      record["timestamp"] = Time.parse(record["timestamp"])
      record["user_id"] = record["user_id"].to_i
      Post.new(record)
    end
  end

  def all_with_user
    query = <<~SQL
      SELECT posts.id,
        posts.content,
        posts.timestamp,
        posts.user_id,
        users.name,
        users.username
      FROM posts
        JOIN users ON users.id = posts.user_id
    SQL

    result_set = DatabaseConnection.exec_params(query, [])

    result_set.map do |record|
      record["id"] = record["id"].to_i
      record["timestamp"] = Time.parse(record["timestamp"])
      record["user_id"] = record["user_id"].to_i
      PostWithUser.new(record)
    end
  end

  def create(post)
    query = <<~SQL
      INSERT INTO posts (content, timestamp, user_id) 
      VALUES ($1, $2, $3)
    SQL
    params = [post.content, post.timestamp, post.user_id]
    DatabaseConnection.exec_params(query, params)
  end

end
