require 'data_mapper'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  
  def self.authenticate(email, password)
    user = self.first(email: email)
    (user && BCrypt::Password.new(user.password_digest) == password) ? user : nil
  end
  
  attr_reader :password
  attr_accessor :password_confirmation
  
  property :id, Serial
  property :email, String
  property :password_digest, Text
  property :name, String
  property :username, String
  
  validates_confirmation_of :password
  validates_length_of :email, :min => 5
  validates_format_of :email, :as => :email_address
  validates_uniqueness_of :email
  
  has n, :messages
  
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end
  
  
 
  
end