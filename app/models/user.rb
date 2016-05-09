require 'bcrypt'

class User
	include BCrypt
  include DataMapper::Resource

  attr_accessor :password_confirmation
  attr_reader :password    
  property :id,   		Serial 
  property :password_hash, 	Text
  property :email,  	String, required: true, :unique => true
  
  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  validates_presence_of :email

  def password
    @password_hash ||= Password.new(password_hash)
  end
  
  def password=(actual_password)
 		@password = BCrypt::Password.create(actual_password)
   	self.password_hash = @password
  end

  def self.authenticate(email, password)
	  user = first(email: email)
	  if user && BCrypt::Password.new(user.password_hash) == password
      user
	  else
	    nil
	  end
	end
end
