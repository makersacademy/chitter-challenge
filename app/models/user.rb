require 'data_mapper'
require 'dm-postgres-adapter'

require 'bcrypt'

class User
  include DataMapper::Resource

  property :id, Serial
  property :name, String
  property :user_name, String, unique: true
  property :email, String, format: :email_address, unique: true
  property :password_digest, Text

  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate user_name, email, password
    user = User.first(user_name: user_name, email: email)
    user && BCrypt::Password.new(self.password_digest) == password
  end

end
