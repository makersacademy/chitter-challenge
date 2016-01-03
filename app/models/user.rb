require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, unique: true, required: true
  property :email, String, unique: true, format: :email_address, required: true,
           messages: {
              presence: 'Please enter an email address',
              is_unique: 'That email address is already registered',
              format: 'Please enter a valid email address'
            }
  property :password_digest, Text

  has n, :peeps, through: Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message:'Passwords did not match'

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password) if password.size > 0
  end

  def self.authenticate(email, password)
    user = first(email: email)
    user if user && BCrypt::Password.new(user.password_digest) == password
  end

end
