require 'bcrypt'
require 'dm-validations'

class User
  include DataMapper::Resource

  has n, :posts, through: Resource

  attr_accessor :password_confirmation
  attr_reader :password

  property :id, Serial
  property :name, String
  property :username, String, unique: true
  property :email, String, required: true, format: :email_address, unique: true
  property :password_digest, Text
  validates_confirmation_of :password


  def self.authenticate(username, password)
    user = first(username: username)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end


end

