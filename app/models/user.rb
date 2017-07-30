require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource
  include BCrypt

  has n, :peeps, through: Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, format: :email_address, unique: true, required: true
  property :password_digest, Text

  validates_uniqueness_of :email, :message
  validates_uniqueness_of :username, :message
  validates_confirmation_of :password, :message
  validates_presence_of :email
  validates_format_of :email, as: :email_address

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

end
