require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'

class User

  attr_reader :password
  attr_accessor :password_confirmation

  include DataMapper::Resource
  validates_confirmation_of :password
  validates_format_of :email, as: :email_address

  property :id, Serial
  property :email, String, required: true, unique: true
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
end

DataMapper.finalize
DataMapper.auto_upgrade!
