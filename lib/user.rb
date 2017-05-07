require 'bcrypt'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, 		Serial
  property :email_address, 	String, format: :email_address, required: true
  property :user_name, 		String
  property :real_name, 		String
  property :password_digest, 	Text
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(params)
    user ||= User.first(email_address: params[:email_address])
    user && BCrypt::Password.new(user.password_digest) == params[:password] ? true : false
  end

end
