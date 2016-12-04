require 'data_mapper'
require 'dm-migrations'
require 'bcrypt'

class User
  include DataMapper::Resource
  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_encrypted, Text

  attr_reader   :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(string)
    @password = string
    self.password_encrypted = BCrypt::Password.create(string)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    if user && BCrypt::Password.new(user.password_encrypted) == password
      user
    else
      nil
    end
  end

end
