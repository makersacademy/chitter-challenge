require 'bcrypt'
require 'securerandom'

class User
  include DataMapper::Resource

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :name, String, required: true, unique: true

  has n, :peeps
  has n, :responses

  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text
  property :password_token, String, length: 60
  property :password_token_time, Time

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
