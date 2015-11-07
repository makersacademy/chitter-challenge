require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  has n, :peeps, :through => Resource

  property :id, Serial
  property :username, String
  property :email, String
  property :name, String
  property :password_hash, Text

  def password=(password)#overrides the <property name>= method but only for properties named 'password.' So rather than saving it under a password column in the db, the pw is hashed and transferred to a password_hash column
    self.password_hash = BCrypt::Password.create(password)
  end

end
