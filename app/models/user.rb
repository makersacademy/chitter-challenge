require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation

  validates_confirmation_of :password

  has n, :peeps

  property :id,              Serial
  property :username,        String
  property :name,            String
  property :email_address,   String
  property :password_digest, Text

  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
  end

  def self.authenticate(email_address, password)
    user = first(email_address: email_address)
    user && BCrypt::Password.new(user.password_digest) == password ? user : nil
  end
end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
