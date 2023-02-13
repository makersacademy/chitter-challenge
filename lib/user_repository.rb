
require_relative 'user'
require_relative 'database_connection'

class UserRepository

  def find(user_id)
    sql = '
            SELECT *
            FROM users
            WHERE id = $1;
          '
    record = DatabaseConnection.exec_params(sql, [user_id])[0]

    user = User.new
    user.id = record['id']
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']

    user
  end

  def create(new_user)
    sql = '
            INSERT INTO users (name, username, email, password)
            VALUES($1,$2,$3,$4);
          '
    DatabaseConnection.exec_params(sql, [new_user.name, new_user.username, new_user.email, new_user.password])
  end

  # def all
  #   sql = '
  #           SELECT *
  #           FROM posts;
  #         '
  #   result_set = DatabaseConnection.exec_params(sql, [])

  #   posts = []

  #   result_set.each{
  #     |record|
  #     post = Post.new
  #     post.id = record['id']
  #     post.title = record['title']
  #     post.contents = record['contents']
  #     post.time = record['time']
  #     post.user_id = record['user_id']

  #     posts.push(post)
  #   }

  #   posts
  # end

end