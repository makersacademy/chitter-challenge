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
    user_repo = UserRepository.new
    if user_repo.check_logged_in(user_name) == true
      time = Time.now
      sql = 'INSERT INTO posts (content, date_time, user_id) VALUES ($1, $2, $3);'
      post_added = DatabaseConnection.exec_params(sql, [new_content, Time.now, find_user_id(user_name)])
      #binding.irb
      return true
    else
      return false
    end
  end 

  private

  # Method created to add user id as foreign key to SQL insert query. User id not needed elswhere
  def find_user_id(user_name)
    user = User.new
    sql = 'SELECT id FROM users WHERE user_name=$1;'
    result_set = DatabaseConnection.exec_params(sql,[user_name])
    user.id = result_set[0]['id']
    return user.id
  end
end