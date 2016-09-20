require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource
  include BCrypt

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60

  has n, :peeps

  attr_accessor :password_confirmation
  attr_reader :password

  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end


end
