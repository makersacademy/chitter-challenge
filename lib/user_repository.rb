require_relative 'user'

class UserRepository

  def all
    sql = 'SELECT id, name, username, email_address, password_hash FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])
    users = []
    result_set.each do |record|
      user = User.new
      user.id = record['id'].to_i
      user.name = record['name']
      user.username = record['username']
      user.email_address = record['email_address']
      user.password_hash = record['password_hash']
      users << user
    end
    return users
  end 


  def create(user)
    sql = 'INSERT INTO users (name, username, email_address, password_hash) VALUES ($1, $2, $3,$4 );'
    result = DatabaseConnection.exec_params(sql, [user.name, user.username, user.email_address, user.password_hash])
    return ''
  end



  def find(id)
    sql = 'SELECT id, name, username, email_address, password_hash FROM users WHERE id = $1;'
    result = DatabaseConnection.exec_params(sql, [id]).first
    user = User.new
    user.id = result['id'].to_i
    user.name = result['name']
    user.username = result['username']
    user.email_address = result['email_address']
    user.password_hash = result['password_hash']
    return user
  end

  def find_by_email(email_address)
    sql = 'SELECT id, name, email_address, password_hash FROM users WHERE email_address = $1;'
    result = DatabaseConnection.exec_params(sql, [email_address]).first
    return nil if result.nil?
    user = User.new
    user.id = result['id'].to_i
    user.name = result['name']
    user.username = result['username']
    user.email_address = result['email_address']
    user.password_hash = result['password_hash']
    return user
  end

  def login(email_address,password_hash)
    login = find_by_email(email_address)
    return nil if login.nil?
    return  password_hash == login.password_hash
  end
end