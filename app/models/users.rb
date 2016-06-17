require 'bcrypt'
require 'data_mapper'
require 'dm-postgres-adapter'

class User

	include DataMapper::Resource

	property :id, Serial
	property :name, String, required: true
	property :email, String, required: true, format: :email_address, unique: true
	property :password_digest, String, length:60


def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

end

DataMapper.setup(:default, ENV['DATABASE_URL'] || "postgres://localhost/chitter_#{ENV['RACK_ENV']}")

DataMapper.finalize

DataMapper.auto_upgrade!