require 'rubygems'
require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource
  
  property :id,              Serial
  property :name,            String
  property :surname,         String 
  property :email,           String 
  property :password_digest, String, length: 60
  property :username,        String 

  def password=(password)
    self.password_digest = BCrypt::Password.create(password)
  end 
  
  def self.validate(user_details)
    username_exists?(user_details[:username]) &&
    valid_password?(user_details[:password])
  end

  private

  def self.username_exists?(username)
    @user = User.first(username: username) 
  end
  
  def self.valid_password?(password)
    BCrypt::Password.new(@user.password_digest) == password
  end
end
