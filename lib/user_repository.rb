require_relative 'user'
require 'bcrypt'

class UserRepository
  def create(user)
    encrypted_password = BCrypt::Password.create(user.password)
    
    sql = '
    INSERT INTO users (email, password, name, username)
    VALUES($1, $2, $3, $4);'

    params = [user.email, encrypted_password, user.name, user.username]

    DatabaseConnection.exec_params(sql, params)
  end

  def log_in(email, submitted_password)
    user = find_by_email(email)
    
    return nil if user.nil?

    stored_password = BCrypt::Password.new(user.password)

    return user.id if stored_password == submitted_password
  end

  def tag_users(peep_id, tags)
    tags_as_array = tags.gsub(/[,@]/, "").split

    tags_as_array.each do |tag|
      user = find_by_username(tag)
      next if user.nil?

      sql = 'INSERT INTO peeps_users (peep_id, user_id)
      VALUES ($1, $2);'

      params = [peep_id, user.id]

      DatabaseConnection.exec_params(sql, params)
    end
  end

  def find_by_username(username)
    sql = 'SELECT id, email, name, username
    FROM users
    WHERE username = $1;'

    params = [username]

    user = DatabaseConnection.exec_params(sql, params)

    return create_user(user[0]) unless user.count.zero?
  end

  private

  def find_by_email(email)
    sql = 'SELECT id, email, password, name, username
    FROM users
    WHERE email = $1;'

    params = [email]

    user = DatabaseConnection.exec_params(sql, params)
  
    return create_user(user[0]) unless user.count.zero?
  end

  def create_user(record)
    user = User.new
    user.id = record['id'].to_i
    user.email = record['email']
    user.password = record['password']
    user.name = record['name']
    user.username = record['username']
    return user
  end
end
