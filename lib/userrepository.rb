class UserRepository
  def create(new_user)
    # Encrypt the password to save it into the new database record.
    encrypted_password = BCrypt::Password.create(new_user.password)

    sql = 'INSERT INTO users (email, password) VALUES($1, $2);'
    sql_params = [new_user.email, encrypted_password]
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

  def find_by_email(email)
    # ...
  end   
end
