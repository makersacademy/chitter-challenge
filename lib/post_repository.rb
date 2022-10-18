require_relative 'post'

class PostRepository
  def all
    posts = []

    sql = 'SELECT * FROM posts ORDER BY time_posted DESC;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.content = record['content']
      post.time_posted = record['time_posted']
      post.user_id = record['user_id'].to_i

      posts << post
    end

    posts
  end

  def create(post)
    sql = 'INSERT INTO posts (content, time_posted, user_id) VALUES ($1, $2, $3);'
    sql_params = [post.content, post.time_posted, post.user_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end
end
