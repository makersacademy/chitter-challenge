require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String, :required => true
  property :username, String, :required => true, :unique => true
  property :email, String, :required => true, :unique => true
  property :encrypted_password, Text
  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address
  validates_presence_of :password

  # has n, :peeps, through: Resource
end
