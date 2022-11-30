require_relative 'user'

class UserRepository
  def all
    all_users = []
    sql = 'SELECT id, name, email_address, username, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.email_address = record['email_address']
      user.username = record['username']
      user.password = record['password']
      all_users << user
    end
    all_users
  end

  def find(id)
    sql = 'SELECT id, name, email_address, username, password FROM users WHERE id = $1;'
    params = [id]
    result_set = DatabaseConnection.exec_params(sql, params)
    record = result_set[0]
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.email_address = record['email_address']
    user.username = record['username']
    user.password = record['password']
    user
  end

  def create(user)
    sql = 'INSERT INTO users (name, email_address, username, password) VALUES ($1, $2, $3, $4);'
    params = [user.name,user.email_address,user.username,user.password]
    DatabaseConnection.exec_params(sql, params)
  end

  def already_exists?(user)
    sql = 'SELECT email_address, username FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    same_username = result_set.any? { |record| record['username'] == user.username }
    same_email = result_set.any? { |record| record['email_address'] == user.email_address }
    same_username or same_email
  end
end
