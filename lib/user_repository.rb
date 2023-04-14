require_relative "./user"
require 'bcrypt'

class UserRepository
  def all
    sql = 'SELECT * FROM users;'
    result_set = DatabaseConnection.exec_params(sql, [])

    users = []
    
    result_set.each do |row|
      user = User.new
      user.id = row['id'].to_i
      user.name = row['name']
      user.username = row['username']
      user.email = row['email']
      user.password = row['password']
      users << user
    end

    return users
  end

  def find_by_username(username)
    sql = 'SELECT * FROM users WHERE username = $1;'
    result = DatabaseConnection.exec_params(sql, [username]).first

    return nil unless result

    user = User.new
    user.id = result['id'].to_i
    user.username = result['username']
    user.name = result['name']
    user.email = result['email']
    user.password = result['password']

    return user
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users WHERE email = $1;'
    result = DatabaseConnection.exec_params(sql, [email]).first

    return nil unless result

    user = User.new
    user.id = result['id'].to_i
    user.username = result['username']
    user.name = result['name']
    user.email = result['email']
    user.password = result['password']

    return user
  end

  def login(username, submitted_password)
    user = find_by_username(username)
    return { success?: false, failure_reason: "invalid username" } if user.nil?
    stored_password = BCrypt::Password.new(user.password)

    
    return { success?: true, username: user.username, user_id: user.id } if stored_password == submitted_password
    
    return { success?: false, failure_reason: "incorrect password" }
  end

  def register(username, name, email, password)

    return { success?: false, failure_reason: "username is already taken" } if find_by_username(username)
    return { success?: false, failure_reason: "email is already taken" } if find_by_email(email)
  
    sql = 'INSERT INTO users (username, name, email, password) VALUES ($1, $2, $3, $4);'

    hashed_password = BCrypt::Password.create(password)
    params = [username, name, email, hashed_password]

    DatabaseConnection.exec_params(sql, params)

    return { success?: true }
  end

  def check_for_matching(possible_tags) #takes and array of strings formatted as '@text'
    tagged_users = []

    return tagged_users if possible_tags.empty?

    if possible_tags.length == 1
      # Use array slicing to remove the @ symbol from the search
      user = find_by_username(possible_tags.first[1..-1])
      return tagged_users if user.nil?
      tagged_users << user
    else
      # retrieve an array of all User objects
      all_users = all

      possible_tags.each do |possible_tag|
        all_users.each do |user|
          if possible_tag[1..-1] == user.username
            tagged_users << user
          end
        end
      end
    end

    return tagged_users
  end
end
