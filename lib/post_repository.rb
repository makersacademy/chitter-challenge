require_relative 'post'

class PostRepository
  def all
    posts = []

    sql = 'SELECT id, message, datetime, user_id FROM posts ORDER BY datetime DESC;'
    result_set = DatabaseConnection.exec_params(sql,[])

    result_set.each do |record|
      post = Post.new

      post.id = record['id'].to_i
      post.message = record['message']
      post.datetime = record['datetime']
      post.user_id = record['user_id']

      posts << post
    end

    return posts
  end

  def create(post)

    timestamp = Time.now.strftime("%Y-%m-%d %H:%M:%S").to_s

    sql = 'INSERT INTO posts (message, user_id, datetime) VALUES ($1, $2, $3);'
    params = [post.message, post.user_id, timestamp ]

    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  def find(id)
    sql = 'SELECT id, message, datetime, user_id FROM posts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    post = Post.new
    post.id = result_set[0]['id'].to_i
    post.message = result_set[0]['message']
    post.datetime = result_set[0]['datetime']
    post.user_id = result_set[0]['user_id'].to_i

    return post
  end

end
