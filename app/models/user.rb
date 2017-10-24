
class User

  include DataMapper::Resource
  
  property :id, Serial
  property :first_name, String
  property :last_name, String
  property :username, String, :unique => true 
  property :email, String, :unique => true 
  property :password, Text

  has n, :peeps
  has n, :replies

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password) == password
      return user
    else
      return nil
    end
  end

end
