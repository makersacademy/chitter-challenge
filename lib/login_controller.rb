require_relative 'user'

class LoginController

  def self.log_in(username, password)
    if User.user_exists?(username)
      user = User.find_by_username(username)
      if correct_password?(password, user)
        true
      else
        false
      end
    else
      false
    end
  end

  def self.log_out
    false
  end

  def self.correct_password?(password, user)
    password == user.password
  end

end
