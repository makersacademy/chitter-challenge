require_relative './post'

class PostRepository
  def all
    sql = 'SELECT id, message, timestamp, user_id FROM posts ORDER by id;'
    result = DatabaseConnection.exec_params(sql, [])

    return post_object(result)
  end

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])

    return post_object(result)[0]
  end

  def create(post)
    sql = 'INSERT INTO posts (message, timestamp, user_id) VALUES ($1, $2, $3);'
    params = [post.message, post.timestamp, post.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def update_message(id, val)
    sql = 'UPDATE posts SET message = $2 WHERE id = $1;'
    params = [id, val]
    DatabaseConnection.exec_params(sql, params)
  end

  def update_user_id(id, val)
    sql = 'UPDATE posts SET user_id = $2 WHERE id = $1;'
    params = [id, val]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end

  private

  def post_object(result)
    posts = []
    result.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.message = record['message']
      post.timestamp = record['timestamp']
      post.user_id = record['user_id'].to_i
      posts << post
    end
    return posts
  end
end