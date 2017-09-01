require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include BCrypt
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String
  property :username, String, unique: true, required: true
  property :email, String, unique: true, format: :email_address, required: true
  property :password_digest, Text

  has n, :peeps, :through => Resource

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def self.authenticate(email, password)
    current_user = first(:email => email)
    return nil if current_user.nil? || Password.new(current_user.password_digest) != password
    current_user
  end

  validates_confirmation_of :password
end
