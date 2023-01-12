require_relative 'post'

class PostRepository
  def all
    posts = []
     sql = 'SELECT * FROM posts;'
     result_set = DatabaseConnection.exec_params(sql,[])

     result_set.each do |record|
      post = Post.new
      post.id = record['id']
      post.content = record['content']
      post.date_time = record['date_time']
      post.user_id = record['user_id']

      posts << post
    end
    return posts
  end

  def create(user_name, new_content)
    user_id_sql = "SELECT id FROM users WHERE user_name = $1;"
    user_id_result = DatabaseConnection.exec_params(user_id_sql,[user_name])
    user_id = user_id_result[0]['id']
    time = Time.now
    sql = 'INSERT INTO posts (content, date_time, user_id) VALUES ($1, $2, $3);'
    result_set = DatabaseConnection.exec_params(sql, [new_content, Time.now, user_id])
  end
end 