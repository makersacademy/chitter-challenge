require_relative './user'

class LogIn
  
  def self.validate(email, password)
    ## Predicate method that checks for existence of an email in the DB
    ## and if its associated password matches the argument
    user = User.find_user('email', email)
    return !!user && user.password == password
  end
end