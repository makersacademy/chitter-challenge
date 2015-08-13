require "bcrypt"

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true, 
    :messages => { :presence  => "Please enter your name." }
  property :email, String, required: true, 
    :messages => { :presence => "Please enter a valid email address." }
  property :username, String, required: true, 
    :messages => { :presence => "Please enter the username you want to use." }
  
  property :password_digest, Text
  
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, 
    :message => "Password and confirmation password do not match."
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end