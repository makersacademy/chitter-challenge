require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource

  attr_reader   :password
  attr_accessor :password_confirmation

  property :id,              Serial
  property :name,            String
  property :username,        String
  property :email,           String
  property :password_digest, Text

  def password=(password)
    @password = password
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

  validates_uniqueness_of   :username,
    message: 'Chosen username is already in use.'

  validates_presence_of     :email,
    message: 'You must enter an email to sign up.'

  validates_format_of       :email, as: :email_address,
    message: 'You must enter a valid email to sign up.'

  validates_uniqueness_of   :email,
    message: 'Account with that email already exists.'

  validates_confirmation_of :password,
    message: 'Password and confirmation password do not match.'

  has n, :peeps
end
