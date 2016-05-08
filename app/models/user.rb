require 'data_mapper'
require 'dm-postgres-adapter'
require 'bcrypt'
require 'dm-validations'


class User

	include DataMapper::Resource

	attr_reader :password
  	attr_accessor :password_confirmation

	property :id,					Serial
	property :name,					String
	property :mail,					String
	property :password_digest,		Text

	validates_confirmation_of :password

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end
	
	def self.authenticate(mail, password)
		user = first(mail: mail)
		if user && BCrypt::Password.new(user.password_digest) == password
			user
		else
			nil
		end
	end

end

# DataMapper.setup(:default, "postgres://localhost/chitter")
# DataMapper.finalize
# DataMapper.auto_upgrade!