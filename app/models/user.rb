require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :username, String
  property :email, Text, :required => true, :unique => true
  property :encrypted_password, Text

  attr_accessor :password_confirmation
  attr_reader :password

  def password=(password)
    @password = password
    self.encrypted_password = BCrypt::Password.create(password)
  end

  validates_confirmation_of :password
  validates_presence_of :name, :username, :email, :password
  validates_format_of :email, as: :email_address
end
