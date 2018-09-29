require_relative 'peep'

class Login
  def self.user_pass_ok?(username, password)
    user = User.first(:user => username)
    !!(user && user[:password] == password)
  end
end
