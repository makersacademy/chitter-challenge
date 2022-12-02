
class UserRepository

  def create(new_user)

    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (username, password, name, email) VALUES($1, $2, $3, $4);'
    sql_params = [
      new_user.username,
      encrypted_password,
      new_user.name,
      new_user.email
    ]
  end

  def sign_in(username, submitted_password)
    user = find_by_username(username)

    return nil if user.nil?

    if submitted_password == BCrypt::Password.new(user.password)
      # login success
    else
      # wrong password
    end
  end

  def find_by_username(username)
    # ...
  end
end
