require 'bcrypt'

class User

  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation 

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :name, String
  property :handle, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, String, length: 60

  def password=(password)
  	@password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

end