require_relative './post'

class PostRepository
  def all
    sql = 'SELECT id, message, timestamp, user_id FROM posts'
    result_set = DatabaseConnection.exec_params(sql, [])
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