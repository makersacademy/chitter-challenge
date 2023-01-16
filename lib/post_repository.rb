require_relative './post'

class PostRepository

  def all
    posts = []

    sql = "SELECT id, content, post_timestamp, user_id FROM posts;"
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.content = record['content']
      post.post_timestamp = record['post_timestamp']
      post.user_id = record['user_id']

      posts << post
    end
    return posts
  end 

  def timeline
    posts = []

    sql = "SELECT id, content, post_timestamp, user_id FROM posts;"
    result_set = DatabaseConnection.exec_params(sql, [])
    
    result_set.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.content = record['content']
      post.post_timestamp = record['post_timestamp']
      post.user_id = record['user_id']

      posts << post
    end
    return posts.reverse
  end 

  def find(id)
    sql = 'SELECT id, content, post_timestamp, user_id FROM posts WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])

    post = Post.new
    post.id = result[0]['id'].to_i
    post.content = result[0]['content']
    post.post_timestamp = result[0]['post_timestamp']
    post.user_id = result[0]['user_id'].to_i

    return post 
  end 

  def view_user_posts(user_id)

    posts = []
    
    sql = 'SELECT id, content, post_timestamp, user_id FROM posts WHERE user_id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [user_id])

      result_set.each do |record|
      post = Post.new
      post.id = record['id'].to_i
      post.content = record['content']
      post.post_timestamp = record['post_timestamp']
      post.user_id = record['user_id'] # 

      posts << post
    end
    return posts
  end 

  def create(post)
    sql = 'INSERT INTO posts (content, post_timestamp, user_id) VALUES($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [post.content, post.post_timestamp, post.user_id])
    return post
  end 

end 