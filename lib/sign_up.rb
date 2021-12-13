require_relative './user'

class SignUp
  
  def self.validate(username, email)
    username_valid?(username) && email_valid?(email)
  end


  private
  def self.username_valid?(username)
    !!User.find_user('username', username) ? false : true
  end

  def self.email_valid?(email)
    true ## TODO: run method to check email is unique
    !!User.find_user('email', email) ? false : true
  end
end