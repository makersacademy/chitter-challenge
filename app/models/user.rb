require 'bcrypt'
require 'securerandom'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource

  has n, :peeps

  property :id, Serial
  property :email, String, format: :email_address, required: true, unique: true
  property :username, String, required: true
  property :password_digest, Text
  
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

  validates_confirmation_of :password, as: :username

end
