require "bcrypt"
require_relative "./user"
require_relative "./record_methods"

class UserRepository

  def exist?(user)
    sql = "SELECT * FROM users WHERE username = $1 OR email = $2;"
    params = [user.username, user.email]
    result_set = DatabaseConnection.exec_params(sql, params)

    return result_set.ntuples.positive?
  end

  def find(string)
    sql = "SELECT * FROM users WHERE  username = $1 OR email = $1;"
    result = DatabaseConnection.exec_params(sql, [string])
    begin
      record = result[0]
      user = Record.to_user(record)
      user_with_peeps = get_peeps(user)

      return user_with_peeps
    rescue IndexError=> exception
      return nil
    end 
  end

  def get_peeps(user)
    sql = "SELECT * FROM peeps WHERE user_id = $1;"
    result = DatabaseConnection.exec_params(sql, [user.id])
    result.each do |record|
      user.peeps << Record.to_peep(record)
    end
    return user
  end

  def create(new_user)
    return if exist?(new_user)

    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (fullname, username, email, password)
            VALUES($1, $2, $3, $4);'
    params = [new_user.fullname, new_user.username, new_user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, params)
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return nil if user.nil?

    # Compare the submitted password with the encrypted one saved in the database
    if submitted_password == BCrypt::Password.new(user.password)
      # login success
    else
      # wrong password
    end
  end
  def find_by_email(user)

    
  end
end