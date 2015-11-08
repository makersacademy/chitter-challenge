require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt
  attr_reader :password

  property :id, Serial
  property :username, String
  property :email, String
  property :name, String
  property :password_hash, Text

  def password=(password)#overrides the <property name>= method but only for properties named 'password.' So rather than saving it under a password column in the db, the pw is hashed and transferred to a password_hash column
    @password = password #required for calling user.password, which is necessary for authentication - see solution to ch. 19. I think having it in an instance variable means it doesn't go in the db(??)
    self.password_hash = BCrypt::Password.create(password)
  end

  def self.authenticate(email,password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_hash) == password #see solution to bookmark manager ch.19 for explanation of this.
      user
    else
      nil
    end
  end


end
