require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, Text, required: true
  property :username, String, required: true, unique: true
  property :email_address, String, required: true, unique: true
  property :password_hash, BCryptHash
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email_address, as: :email_address

  has n, :peeps

  def password
    @password ||= Password.new(password_hash)
  end

  def self.authenticate(email,login_password)
      user = first(email_address: email)
      user if  user && user.password == login_password
  end

  def password=(password)
    @password = password
    self.password_hash = BCrypt::Password.create(password)
  end

end
