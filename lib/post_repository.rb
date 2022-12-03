require_relative 'post'

class PostRepository

  def all 
    sql = 'SELECT id, title, content, create_at, user_id FROM posts;'
    result_set = DatabaseConnection.exec_params(sql,[])

    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.create_at = record['create_at']
      post.user_id = record['user_id']

      posts << post
    end
    return posts
  end 

  def create(post)
    sql = 'INSERT INTO posts (title, content, create_at, user_id) VALUES ($1, $2, $3, $4);'
    sql_params = [post.title, post.content, post.create_at, post.user_id]

    DatabaseConnection.exec_params(sql,sql_params)
    
    return nil
  end

  def find(user_id)
    sql = 'SELECT * FROM posts WHERE user_id =$1;'
    
    result_set = DatabaseConnection.exec_params(sql,[user_id])
    
    posts = []

    result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.title = record['title']
      post.content = record['content']
      post.create_at = record['create_at']
      post.user_id = record['user_id']

      posts << post
    end
    return posts
  end
end