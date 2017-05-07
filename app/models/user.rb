require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password

  property :id, Serial
  property :name, String
  property :email, String
  property :username, String
  property :password_digest, Text

  def password=(password)
     @password = password
     self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    # Datamapper method 'first' finds the first matching record, with keyword argument
    user = first(email: email)
    # Returns the user if e-mail found, and if 'Password' object with hash of real password 'equals'
    # (the special '==' for this class) the password passed in as a parameter
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

end
