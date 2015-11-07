require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt
  
  property :id, Serial
  property :name, String
  property :username, String
  property :email, String, required: true, unique: true
  property :password_digest, Text 

  attr_reader :password
  attr_accessor :password_confirmation
  
  validates_confirmation_of :password
  validates_presence_of :email
  validates_format_of :email, as: :email_address

  def password=(new_password)
    @password = new_password
    self.password_digest = Password.create(new_password)
  end
  
  def self.authenticate(email, password)
    user = first(email: email)

    if user && Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end

