require_relative './user'

class SignUp
  
  def self.validate(username, email)
    ## Class method that validates if sign up credentials are unique; returns bool
    username_valid?(username) && email_valid?(email)
  end


  private
  def self.username_valid?(username)
    ## Class method that determines if a new username can be used; returns bool
    !!!User.find_user('username', username)
  end

  def self.email_valid?(email)
    ## Class method that determines if a new email can be used; returns bool
    !!!User.find_user('email', email)
  end
end