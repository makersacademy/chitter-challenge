require_relative "post"
require_relative "user"

class PostsRepository
  def all
    sql = "SELECT * FROM posts;"
    result_set = DatabaseConnection.exec_params(sql, [])
    posts = []
    result_set.each do |object|
        post = Post.new
        post.id = object["id"]
        post.content = object["content"]
        post.date_created = object["date_created"]
        post.user_id = object["user_id"]
        post.posted_by = object["posted_by"]
        posts << post
   end 
   return posts
  end

  def find(id)
    sql = "SELECT * FROM posts WHERE id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])
    posts = []
    result_set.each do |object|
        post = Post.new
        post.id = object["id"]
        post.content = object["content"]
        post.date_created = object["date_created"]
        post.user_id = object["user_id"]
        posts << post
    end
    return posts.first
  end

  def create(post)
    sql = "INSERT INTO posts(content, date_created, user_id) VALUES($1, $2, $3);"
    params = [post.content, post.date_created, post.user_id]
    DatabaseConnection.exec_params(sql, params)
  end

  def update(post)
   sql = "UPDATE posts SET content = $1, date_created = $2, user_id = $3 WHERE id = $4;"
    params = [post.content, post.date_created, post.user_id, post.id]
    DatabaseConnection.exec_params(sql, params)
  end
  
  def delete(post)
    sql = "DELETE FROM posts WHERE id = $1;"
    DatabaseConnection.exec_params(sql, [post.id])
  end

  def find_user_by_post(post)
    sql = 'SElECT * FROM users WHERE id = $1'
    result_set = DatabaseConnection.exec_params(sql, [post.user_id])
    user = User.new
    result_set.each do |object|
      user.username = object['username']
      user.email = object['email']
      user.password = nil
    end 
    return user
  end 


end