require_relative './user'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    results = DatabaseConnection.exec_params(sql, [])
    users = []
    results.each{ |record| users << user_builder(record) }
    return users
  end

  def create(user)
    sql = 'INSERT INTO users (name, username, email, password) VALUES ($1, $2, $3, $4);'
    params = [user.name, user.username, user.email, user.password]
    DatabaseConnection.exec_params(sql, params)
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    params = [email]
    results = DatabaseConnection.exec_params(sql, params)
    record = results[0]
    this_user = user_builder(record)
    return this_user
  end

  def all_usernames
    sql = 'SELECT username FROM users;'
    results = DatabaseConnection.exec_params(sql, [])
    usernames = []
    results.each{ |record| record.each{ |key, username| usernames << username }}
    return usernames
  end

  def all_emails
    sql = 'SELECT email FROM users;'
    results = DatabaseConnection.exec_params(sql, [])
    emails = []
    results.each{ |record| record.each{ |key, email| emails << email }}
    return emails
  end

  private

  def user_builder(record)
    user = User.new
    user.id = record['id'].to_i
    user.name = record['name']
    user.username = record['username']
    user.email = record['email']
    user.password = record['password']
    return user
  end
  
end