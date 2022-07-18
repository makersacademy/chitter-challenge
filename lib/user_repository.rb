require_relative './user'
require_relative './database_connection'
require 'bcrypt'

class UserRepository

  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)
    insert_return = DatabaseConnection.exec_params('INSERT INTO users (email, username, password) VALUES ($1, $2, $3) RETURNING id', [user.email, user.username, encrypted_password])
    id =insert_return[0]['id'].to_i
  end

  def sign_up(email, username, password)
    if find_by_username(username) != nil
      return nil
    else
      user = User.new
      user.email = email
      user.username = username
      user.password = password
      id = create(user)
      return id
    end 
  end 


  def all
    users = []
    repo = DatabaseConnection.exec_params('SELECT * FROM users',[])
    repo.each{|entry| users << entry_to_user(entry)}
    return users
  end

  def login(username, password)

    user = find_by_username(username)
    return nil if user.nil?
    if BCrypt::Password.new(user.password) == password 
      return user.id
    else 
      return nil
    end 
  end 

  def find_by_username(username)
    repo = DatabaseConnection.exec_params('SELECT id, email, username, password FROM users WHERE username = $1', [username])
    if repo.to_a.length == 0
      return nil
    else
      entry = repo[0]
      user = entry_to_user(entry)
      return user
    end 
  end
     
  def entry_to_user(entry)
    user = User.new
    user.id = entry['id'].to_i
    user.username = entry['username']
    user.password = entry['password']
    user.email = entry['email']
    return user
  end
end 
