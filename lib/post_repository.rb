require 'post'

class PostRepository
  def all
    posts = []

    sql = 'SELECT id, message, message_time, user_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|

      post = Post.new
      post.id = record['id'].to_i
      post.message = record['message']
      post.message_time = record['message_time']
      
      posts << post
    end
      return posts
    end

  def find(id)
    sql = 'SELECT id, message, message_time FROM posts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    post = Post.new
    post.id = result_set[0]['id'].to_i
    post.message = result_set[0]['message']
    post.message_time = result_set[0]['message_time']
    post.user_id = result_set[0]['user_id'].to_i

    return post
  end

  def create(post)
    sql = 'INSERT INTO posts (message, message_time, user_id) VALUES($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [post.message, post.message_time, post.user_id])

    return post
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    sql_params = [id]

    DatabaseConnection.exec_params(sql, sql_params)

    return nil
  end

  def update(post)
    sql = 'UPDATE posts SET message = $1, message_time = $2 WHERE id = $3;'
    sql_params = [post.message, post.message_time, post.id]

    DatabaseConnection.exec_params(sql, sql_params)
  
    return nil
  end
end
