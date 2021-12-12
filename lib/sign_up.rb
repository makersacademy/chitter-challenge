class SignUp
  
  def self.validate(username, email)
    username_valid?(username) && email_valid?(email)
  end


  private
  def self.username_valid?(username)
    true ## TODO: run method to check username is unique
  end

  def self.email_valid?(email)
    true ## TODO: run method to check email is unique
  end
end