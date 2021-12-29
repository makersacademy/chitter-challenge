require_relative './user'

class LogIn
  
  def self.validate(email, password)
    user = User.find_user('email', email)
    if !!user
      if password_valid?(user, password)
        return true
      end
    end

    return false
  end

  def self.password_valid?(user, password)
    user.password == password
  end

end