require_relative 'post'

class PostRepository
  def all
    posts = []

    sql = 'SELECT * FROM posts ORDER BY time_posted DESC;'
    result_set = DatabaseConnection.exec_params(sql, [])

    result_set.each do |record|
      post = Post.new
      set_post(post, record)
      posts << post
    end

    posts
  end

  def create(post)
    sql = 'INSERT INTO posts (content, time_posted, user_id) VALUES ($1, $2, $3);'
    sql_params = [post.content, post.time_posted, post.user_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  def user_mentioned?(post)
    if post.content =~ /@/
      usernames = post.content.scan(/@[\w\d]*/)
      users = usernames.map do |user|
        username = user.scan(/[\w\d]*/)[1]
        find_user(username)
      end
      return !users.compact.empty?
    else
      false
    end
  end

  private

  def set_post(post, record)
    post.id = record['id'].to_i
    post.content = record['content']
    post.time_posted = record['time_posted']
    post.user_id = record['user_id'].to_i
  end

  def set_user(user, result_set)
    user.id = result_set[0]['id'].to_i
    user.username = result_set[0]['username']
    user.name = result_set[0]['name']
    user.email = result_set[0]['email']
    user.password = result_set[0]['password']
  end

  def find_user(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    result_set = DatabaseConnection.exec_params(sql, [username])
    if result_set.cmd_tuples.zero?
      nil
    else
      user = User.new
      set_user(user, result_set)
      user
    end
  end
end
