require_relative 'post'

class PostRepository
  def all
    sql = 'SELECT id, message, time_created, user_id FROM posts ORDER BY time_created DESC;'
    # sql_order_by = 'SELECT * FROM posts ORDER BY time_created DESC;'
    result_set = DatabaseConnection.exec_params(sql, [])

    all_posts = []
    result_set.each do |post|
      all_posts.push(record_to_post_object(post))
    end
    return all_posts
  end

  def find(id)
    sql = 'SELECT id, message, time_created, user_id FROM posts WHERE id = $1;'
    sql_params = [id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
    post = result_set[0]

    return record_to_post_object(post)
  end

  def create(new_post)
    sql = 'INSERT INTO posts (message, time_created, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [new_post.message, new_post.time_created, new_post.user_id])

    return new_post
  end

  def delete(id)
    sql = 'DELETE FROM posts WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id]);
  end

  private

  def record_to_post_object(record)
    post = Post.new

    post.id = record['id'].to_i
    post.message = record['message']
    post.time_created = record['time_created']
    
    return post
  end
end
