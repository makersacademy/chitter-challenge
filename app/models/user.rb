require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User

  include DataMapper::Resource

  property :id, Serial
  property :name, String, required: true
  property :username, String, required: true, unique: true, message: 'Username is already taken'
  property :email, String, unique: true, required: true, format: :email_address
  property :password_digest, Text, required: true

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password, message: "Please enter matching passwords"

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def authenticate(email, password)
    user = User.first(email: email)
    if user && BCrypt::Password.new(user.password_digest) == password
      user
    end
  end

end

DataMapper.setup(:default, 'postgres://localhost/chitter_test' )
DataMapper.finalize
DataMapper.auto_upgrade!
