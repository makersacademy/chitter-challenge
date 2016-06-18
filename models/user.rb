require 'data_mapper'
require 'bcrypt'

class User

  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, String, length: 60
  property :username, String, required: true, unique: true

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
