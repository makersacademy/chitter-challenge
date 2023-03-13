require "bcrypt"
require_relative "./user"
require_relative "./record_methods"

class UserRepository

  # ------------
  # EXIST METHOD
  # ------------

  def exist?(user)
    sql = "SELECT * FROM users WHERE username = $1 OR email = $2;"
    params = [user.username, user.email]
    result_set = DatabaseConnection.exec_params(sql, params)

    return result_set.ntuples.positive?
  end

  # ------------
  # FIND METHOD
  # ------------

  def find_by_id(id)
    sql = "SELECT * FROM users WHERE  id = $1;"
    result_set = DatabaseConnection.exec_params(sql, [id])
    
    return result_set_to_user_object(result_set)
  end

  def find(string)
    sql = "SELECT * FROM users WHERE  username = $1 OR email = $1;"
    result_set = DatabaseConnection.exec_params(sql, [string])
    
    return result_set_to_user_object(result_set)
  end

  def result_set_to_user_object(result_set)
    return "not found" if result_set.ntuples.zero?
    record = result_set[0]
    user = Record.to_user(record)
    user_with_peeps = get_peeps(user)
    return user_with_peeps
  end

  def get_peeps(user)
    sql = "SELECT * FROM peeps WHERE user_id = $1;"
    result = DatabaseConnection.exec_params(sql, [user.id])
    result.each do |record|
      user.peeps << Record.to_peep(record)
    end
    return user
  end

  # ------------
  # LOGIN METHOD
  # ------------

  def login(email, password)
    user = find(email)
    return nil if user == "not found"
    stored = BCrypt::Password.new(user.password)
    return stored == password ? user : "incorrect password"
  end

  # ------------
  # CREATE METHOD
  # ------------

  def create(new_user)
    return "already exists" if exist?(new_user)

    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (fullname, username, email, password)
            VALUES($1, $2, $3, $4);'
    params = [new_user.fullname, new_user.username, new_user.email, encrypted_password]
    DatabaseConnection.exec_params(sql, params)
    return "is successfully registered"
  end 

  # ------------
  # UPDATE METHOD
  # ------------

  def update(sql, sql_params)
    DatabaseConnection.exec_params(sql, sql_params)
    return "The user profile has been successfully updated."
  end 

  def update_password(user, old_password, new_password)
    old_password_check = BCrypt::Password.new(user.password) == old_password
    return "Current password incorrect" if old_password_check == false

    encrypted_password = BCrypt::Password.create(new_password)
    sql = 'UPDATE users SET password = $1 WHERE id = $2;'
    sql_params = [encrypted_password, user.id]
    DatabaseConnection.exec_params(sql, sql_params)

    return "Password successfully updated"
  end 

  def delete(id)
    sql = 'DELETE FROM users WHERE id = $1;'
    DatabaseConnection.exec_params(sql, [id])
    return "Account deleted"
  end
end
