require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  include BCrypt

  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :email, String, required: true, unique: true
  property :username, String,required: true, unique: true
  property :password_digest, String, length: 60

  def password=(password)
    @password = password
    self.password_digest = Password.create(password)
  end

  def self.authenticate(username, password)
    user =first(username: username)
    if user && Password.new(user.password_digest) == password
      user
    else
      nil
    end
  end
end
