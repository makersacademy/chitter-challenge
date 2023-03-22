require_relative 'user'

class UserRepository
  def initialize
    @name = name
    @email_address = email_address
    @password = password
  end

  def all
    sql = 'SELECT id, name, email_address, password FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.email_address = record['email_address']
      user.password = record['password']
      users << user
    end
    return users
  end

  def create(user)
    sql = 'INSERT INTO users (name, email_address, password) VALUES ($1, $2, $3);'
    result = DatabaseConnection.exec_params(sql, [user.name, user.email_address, user.password])
    return ''
end

  def find(id)
    sql = 'SELECT id, name, email_address, password FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id]).first
    user = User.new
    user.id = result['id'].to_i
    user.name = result['name']
    user.email_address = result['email_address']
    user.password = result['password']
    return user
  end

  def find_by_email(email_address)
    sql = 'SELECT id, name, email_address, password FROM users WHERE email_address = $1;'
    result = DatabaseConnection.exec_params(sql, [email_address]).first
    return nil if result.nil?
    user = User.new
    user.id = result['id'].to_i
    user.name = result['name']
    user.email_address = result['email_address']
    user.password = result['password']
    return user
  end

  def login(email_address,password)
    login = find_by_email(email_address)
    return nil if login.nil?
    return  password == login.password
  end
end