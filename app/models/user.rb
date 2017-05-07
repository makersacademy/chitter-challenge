require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true
  property :password_digest, Text
  validates_confirmation_of :password
  validates_format_of :email, :as => :email_address
  validates_presence_of :email
  validates_presence_of :password
  validates_presence_of :username
  #validates_length_of :email, min: 3

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

end
