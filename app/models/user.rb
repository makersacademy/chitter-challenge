require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  property :id,               Serial
  property :name,             String
  property :user_name,        String
  property :password_digest,  Text
  property :email,            String, required: true, unique: true, format: :email_address, messages: { presence: "Please enter your email address", is_unique: "We already have that email", format: "Invalid email address. Please check"}

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password


  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
