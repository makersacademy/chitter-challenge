require 'bcrypt'
require 'data_mapper'

class User
  include DataMapper::Resource

  property :id,       Serial
  property :name,     String
  property :username, String
  property :email,    String
  property :password, String, :length => 100

  def self.encrypt_password(string)
    # :-/
    BCrypt::Password.create string
  end
  
  def self.create_secure(name:, username:, email:, password:)
    # :-/
    hashed_password = encrypt_password(password)
    create(name: name,
           username: username,
           email: email,
           password: hashed_password)
  end
end
