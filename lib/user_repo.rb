require 'bcrypt'

class UserRepository
  def initialize(enc = BCrypt::Password)
    @enc = enc
  end

  def create(new_user)
    check_fail(new_user)
    encrypted_password = @enc.create(new_user[:password])
    sql = 'INSERT INTO users (email, password, name, username)
        VALUES($1, $2, $3, $4);'
    params = [new_user[:email], encrypted_password, new_user[:name], new_user[:username]]
    DatabaseConnection.exec_params(sql, params)
    return
  end

  def sign_in(email, submitted_password)
    user = find_by_email(email)
    return nil if user.nil?
    my_password = @enc.new(user['password'])
    my_password == submitted_password
  end

  def find_by_email(email)
    sql = 'SELECT * FROM users
      WHERE email = $1;'
    result = DatabaseConnection.exec_params(sql, [email])
    fail "user not found" if result.ntuples.zero?
    result[0]
  end

  private

  def check_fail(new_user)
    fail "no email" if new_user[:email].class != String || new_user[:email].empty?
    fail "no password" if new_user[:password].class != String || new_user[:password].empty?
  end
end
