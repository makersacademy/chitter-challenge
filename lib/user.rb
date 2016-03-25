require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password
	attr_accessor :password_confirmation

	validates_format_of :email, as: :email_address
	validates_confirmation_of :password
  validates_uniqueness_of :email, :user_name
  validates_presence_of :password

	property :id, Serial
  property :name, String
  property :user_name, String, unique: true
  property :email, String, format: :email_address, required: true, unique: true
  property :password_digest, Text 

  def password=(password)
    @password = password
  	self.password_digest = BCrypt::Password.create(password)
  end

	has n, :peeps
	
end

