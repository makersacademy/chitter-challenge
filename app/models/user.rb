require 'bcrypt'

class User

	include DataMapper::Resource

	attr_reader :password

	property :id, Serial
	property :name, String
	property :email, String
	property :password_digest, Text
  property :handle, String, length: 15

	def password=(password)
		@password = password
		self.password_digest = BCrypt::Password.create(password)
	end

	# validates_presence_of :email
	# validates_uniqueness_of :email
	#
	# def self.authenticate(test_email, test_password)
	# 	user = first(email: test_email)
	# 	return unless user
	# 	match = (BCrypt::Password.new(user.password_digest) == test_password)
	# 	match ? user : nil
	# end

end
