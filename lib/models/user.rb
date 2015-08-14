require "bcrypt"

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true, 
    :messages => { :presence  => "Please enter your name." }
  property :email, String, required: true, unique: true,
    :messages => { :presence => "Please enter a valid email address.",
                   :is_unique => "Email already in use." }
  property :username, String, required: true, unique: true,
    :messages => { :presence => "Please enter the username you want to use.",
                   :is_unique => "Username taken." }
  
  property :password_digest, Text
  
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, 
    :message => "Password and confirmation password do not match."
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end