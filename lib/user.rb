require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

	include DataMapper::Resource

	validates_format_of :email, as: :email_address

	attr_reader :password
	attr_accessor :password_confirmation

	property :id, Serial
  property :name, String
  property :user_name, String
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text

  def password=(password)
    @password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

end

DataMapper.setup(:default, "postgres://localhost/chitter_#{ENV['RACK_ENV']}")
DataMapper.finalize
DataMapper.auto_upgrade!