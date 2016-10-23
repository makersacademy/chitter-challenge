require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  property :id, Serial
  property :email, String, required: true, unique: true
  property :password_digest, Text

  has n, :peeps, through: Resource

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password, message: 'Password and confirmation password do not match'
  validates_presence_of :email, message: 'Email address is already registered'

  def password=(password)
    @password=password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email, password)
    user = first(email: email)

    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
