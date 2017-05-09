require 'data_mapper'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :username, String, required: true, unique: true
  property :name, String, required: true
  property :password_encrypt, Text, required: true

  has n, :peeps

  validates_confirmation_of :password
  validates_presence_of :email

  def password=(password)
    @password = password
    self.password_encrypt = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)
    return user if user && BCrypt::Password.new(user.password_encrypt) == password
    nil
  end
end
