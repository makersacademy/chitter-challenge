require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-validations'
require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true
  property :email, String, required: true, unique: true, format: :email_address
  property :password_digest, Text

  validates_presence_of :password
  validates_presence_of :password_confirmation
  validates_confirmation_of :password, confirm: :password_confirmation
  validates_with_method :password

  def password=(pword)
    @password = pword
    self.password_digest = BCrypt::Password.create(pword)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  has n, :peeps
end
