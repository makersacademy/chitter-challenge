require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :user_name,        String
  property :password_digest,  Text
  property :email,            String, required: true, unique: true, format: :email_address, messages: { presence: "Please enter your email address", is_unique: "This email has already been registered", format: "Invalid email address"}

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password, message:"Password and confirmation password do not match"
  validates_presence_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
