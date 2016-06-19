require 'data_mapper'
class User
	attr_reader :password
	attr_accessor :password_confirmation
	include DataMapper::Resource

	property :id, Serial
	property :email, String, required: true
	property :password_digest, String, length: 60
	validates_confirmation_of :password
	validates_format_of :email, :as => :email_address
	validates_presence_of :email
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
