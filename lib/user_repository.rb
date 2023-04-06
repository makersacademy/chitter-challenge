require_relative './user'

class UserRepository
  def all

  end

  def create(new_user)
  #   encrypted_password = BCrypt::Password.create(new_user.password)

  #   sql = '
  #     INSERT INTO users (email_address, user_name, password)
  #       VALUES($1, $2, $3);
  #   '
  #   sql_params = [
  #     new_user.email_address,
  #     new_user.user_name
  #     encrypted_password
  #   ]

  #   result_set = DatabaseConnection.exec_params(sql, sql_params)

  #   return new_user
  end
  
  def find_by_email(email)
  end

end
