require_relative './post'

class PostRepository
  def all
    sql = 'SELECT posts.id, content, date, time, user_id, users.name, users.username
    FROM posts JOIN users ON user_id = users.id;'
    result_set = DatabaseConnection.exec_params(sql, [])

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.content = record['content']
      post.date = record['date']
      post.time = record['time']
      post.user_id = record['user_id'].to_i
      post.author_name = record['name']
      post.author_handle = "@#{record['username']}"

      posts << post
    end
    return posts
  end

  def find(id)
    sql = 'SELECT posts.id, content, date, time, user_id, users.name, users.username
            FROM posts JOIN users ON user_id = users.id WHERE posts.id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])

    post = Post.new

    result.each do |record|
      post.id = record['id'].to_i
      post.content = record['content']
      post.date = record['date']
      post.time = record['time']
      post.user_id = record['user_id'].to_i
      post.author_name = record['name']
      post.author_handle = "@#{record['username']}"
    end
    return post
  end

  def create(post)
    sql = 'INSERT INTO posts (content, date, time, user_id) VALUES ($1, $2, $3, $4);'
    result = DatabaseConnection.exec_params(sql, [post.content, post.date, post.time, post.user_id])
    return post
  end

end