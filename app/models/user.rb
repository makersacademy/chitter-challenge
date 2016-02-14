require 'data_mapper'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  
  attr_reader :password
  attr_accessor :password_confirmation
  
  property :id, Serial
  property :email, String
  property :password_digest, Text
  validates_confirmation_of :password
  validates_length_of :email, :min => 5
  validates_format_of :email, :as => :email_address
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  
  property :name, String
  property :username, String
  
end