class Validation

  def self.check_email(email)
    valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email.match?(valid_email)
  end

  def self.check_user_exists(username)
    result = DatabaseConnection.query("SELECT * FROM users where username = '#{username}'")
    return false if result.ntuples == 0
    true
  end

  def self.check_log_in(username, password)
    result = DatabaseConnection.query("SELECT * FROM users where username = '#{username}' and password ='#{password}'")
    return false if result.ntuples == 0
    return username
  end

end