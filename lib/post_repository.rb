require_relative './post'

class PostRepository

  def initialize(timestamp = Time)
    @timestamp = timestamp 
  end

  def all
    sql = 'SELECT posts.id, posts.content, posts.time, posts.user_id,
                  users.name, users.username
           FROM posts JOIN users 
           ON users.id = posts.user_id;'

    result_set = DatabaseConnection.exec_params(sql,[])
    posts = []
    result_set.each { |record| posts << record_to_post(record) }
    
    return posts
  end

  def find(id)
    sql = 'SELECT posts.id, posts.content, posts.time, posts.user_id,
                  users.name, users.username
            FROM posts JOIN users 
            ON users.id = posts.user_id WHERE posts.id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])
    record = result_set[0]
    return record_to_post(record)
  end

  def create(post)
    current_time = @timestamp.now
    sql = 'INSERT INTO posts (content, time, user_id) VALUES($1, $2, $3);'
    params = [post.content, current_time, post.user_id]
    DatabaseConnection.exec_params(sql, params)

    return nil
  end

  private

  def record_to_post(record)
    post = Post.new
    post.id = record["id"].to_i
    post.content = record["content"]
    post.time = record["time"]
    post.user_id = record["user_id"].to_i
    post.name = record["name"]
    post.username = record["username"]
    return post
  end
end
