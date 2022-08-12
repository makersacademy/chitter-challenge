require 'bcrypt'

class UserRepository
  def initialize(enc = BCrypt::Password)
    @enc = enc
  end

  def create(new_user)
    encrypted_password = @enc.create(new_user[:password])
    sql = 'INSERT INTO users (email, password)
        VALUES($1, $2);'
    params = [new_user[:email], encrypted_password]
    DatabaseConnection.exec_params(sql, params)
    return
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?

    my_password = @enc.new(user['password'])
    if my_password == submitted_password
      "success"
    else
      "fail"
    end
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users
      WHERE email = $1;'
    result = DatabaseConnection.exec_params(sql, [email])
    result[0]
  end
end
