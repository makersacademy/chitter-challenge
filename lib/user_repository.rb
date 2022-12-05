# file: lib/user_repository.rb
require_relative './user'
require 'bcrypt'

class UserRepository

  def create(new_user)
    # Encrypt the password to save it into the new database record.
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = '
      INSERT INTO users (email, password)
        VALUES($1, $2);
    '
    sql_params = [
      new_user.email,
      encrypted_password
    ]
    result = DatabaseConnection.exec_params(sql, sql_params)
    puts 'User account successfully created'
  end




  def sign_in(email, submitted_password)
    user = find_by_email(email)

    return 'Account does not exist' if user.nil?

    # Compare the submitted password with the encrypted one saved in the database
    if BCrypt::Password.new(user.password) == submitted_password
      # login success
      return true
    else
      # wrong password
      return false
    end
  end



  def find_by_email(email)
    sql = 'SELECT users.id,
                  users.email,
                  users.password
            FROM users
            WHERE users.email = $1;'
      params = [email]
      result = DatabaseConnection.exec_params(sql, params)

      if result.ntuples == 0
        return nil
      else
        user = result[0]
        return record_to_object(user)
      end
  end




  private
  def record_to_object(record)
    object = User.new
    object.id = record['id'].to_i
    object.email = record['email']
    object.password = record['password']
    return object
  end


end
