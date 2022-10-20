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

  def find(id)
    sql = 'SELECT * FROM posts WHERE id = $1;'
    result_set = DatabaseConnection.exec_params(sql, [id])

    post = Post.new
    find_post(post, result_set)
    post
  end

  def create(post)
    sql = 'INSERT INTO posts (content, time_posted, user_id, parent_id) VALUES ($1, $2, $3, $4);'
    sql_params = [post.content, post.time_posted, post.user_id, post.parent_id]
    result_set = DatabaseConnection.exec_params(sql, sql_params)
  end

  def user_mentioned?(post)
    if post.content =~ /@/
      users = mentioned_users(post)
      return !users.empty?
    else
      false
    end
  end

  def mentioned_users(post)
    usernames = post.content.scan(/@[\w]*/)
    users = usernames.map do |user|
      username = user.scan(/[\w]*/)[1]
      find_user(username)
    end.compact
  end

  def replies?(post)
    result_set = get_replies(post)
    !result_set.cmd_tuples.zero?
  end

  def all_replies(post)
    result_set = get_replies(post)

    posts = []

    result_set.each do |record|
      post = Post.new
      set_post(post, record)
      posts << post
    end

    posts
  end

  private

  def set_post(post, record)
    post.id = record['id'].to_i
    post.content = record['content']
    post.time_posted = record['time_posted']
    post.user_id = record['user_id'].to_i
    post.parent_id = record['parent_id'].to_i
  end

  def find_post(post, result_set)
    post.id = result_set[0]['id'].to_i
    post.content = result_set[0]['content']
    post.time_posted = result_set[0]['time_posted']
    post.user_id = result_set[0]['user_id'].to_i
    post.parent_id = result_set[0]['parent_id'].to_i
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
      user.email
    end
  end

  def get_replies(post)
    sql = 'SELECT * FROM posts WHERE parent_id = $1;'
    DatabaseConnection.exec_params(sql, [post.id])
  end
end
