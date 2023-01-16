require_relative './user'
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT id, username, password, email, name FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []

    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.username = record['username']
      user.password = record['password']
      user.email = record['email']
      user.name = record['name']
      users << user
    end
    return users
  end

  def find(id)
    sql = 'SELECT id, username, password, email, name FROM users WHERE users.id = $1;'
    result = DatabaseConnection.exec_params(sql, [id])
    user = process_user_record(result)
    return user
  end

  def find_by_email(email)
    sql = 'SELECT id, username, password, email, name FROM users WHERE email = $1;'
    result = DatabaseConnection.exec_params(sql, [email])
    user = process_user_record(result)
    return user
  end

  def create(user)
    # encrypted_password = BCrypt::Password.create(user.password)
    sql = 'INSERT INTO users (username, password, email, name) VALUES ($1, $2, $3, $4);'
    DatabaseConnection.exec_params(sql, [user.username, user.password, user.email, user.name])
    return nil
  end

  def find_posts(user_id)
    sql = 'SELECT users.id, username, name, content, date, time
            FROM users JOIN posts ON users.id = user_id
            WHERE users.id = $1;'
    result = DatabaseConnection.exec_params(sql, [user_id])
    user = User.new
    result.each do |record|
      user.id = record['id'].to_i
      user.username = record['username']
      user.name = record['name']
      post = Post.new
      post.content = record['content']
      post.date = record['date']
      post.time = record['time']
      user.posts << post
    end
    return user
  end

  def process_user_record(result)
    user = User.new
    result.each do |record|
      user.id = record['id'].to_i
      user.username = record['username']
      user.password = record['password']
      user.email = record['email']
      user.name = record['name']
    end
    return user
  end
end

