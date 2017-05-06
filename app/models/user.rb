require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'
require 'dm-migrations'


class User
  include DataMapper::Resource
  attr_reader :password
  attr_accessor :password_confirmation
  validates_confirmation_of :password

  property :id, Serial
  property :name, String
  property :email, String, required: true, unique: true
  property :username, String, required: true, unique: true
  property :password_encrypt, Text

  validates_format_of :email, as: :email_address

  def password=(password)
    @password = password
    self.password_encrypt = BCrypt::Password.create(password)
  end
end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!
