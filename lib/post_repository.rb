require_relative './post'
require_relative './database_connection'

class PostRepository
  def all
    sql = 'SELECT id, message, timestamp, user_id 
           FROM posts 
           ORDER by id;'
    result_set = DatabaseConnection.exec_params(sql, [])

    return get_posts(result_set)
  end

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    return get_posts(result_set)[0]
  end

  def create(post)
    sql = 'INSERT INTO posts 
          (message, timestamp, user_id) 
          VALUES ($1, $2, $3);'
    params = [post.message, post.timestamp, post.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def update(id, col, val)
    sql = 'UPDATE posts SET message = $2 WHERE id = $1;' if col == 'message'
    sql = 'UPDATE posts SET user_id = $2 WHERE id = $1;' if col == 'user_id'

    params = [id, val]
    DatabaseConnection.exec_params(sql, params)
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
  end

  private

  def get_posts(result_set)
    posts = []
    result_set.each do |record|
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
