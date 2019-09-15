class Validation

  def self.check_email(email)
    valid_email = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    email.match?(valid_email)
  end

  def self.check_user_exists(username)
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user| 
      if user["username"] == username
        return true
      end
    end
    false
  end

  def self.check_log_in(username, password)
    result = DatabaseConnection.query("SELECT * FROM users")
    result.map do |user| 
      if user["username"] == username && user["password"] == password
        return user["username"]
      end
    end
    false
  end

end