require 'bcrypt'

class User
	attr_reader :password
 	attr_accessor :password_confirmation
	include DataMapper::Resource

has n, :peeps

property :id, Serial
property :username, String, required:true, unique: true
property :email, String, required: true, format: :email_address, unique: true
property :name, String
property :password_digest, Text

 validates_confirmation_of :password
 validates_presence_of :email
 validates_format_of :email, as: :email_address
 validates_uniqueness_of :email
 validates_uniqueness_of :username

def password=(password)
  @password = password
  self.password_digest = BCrypt::Password.create(password)
end

def self.authenticate(email, password)
	user = User.first(email: email)
		if user && BCrypt::Password.new(user.password_digest) == password
	      	user
		 	else
		 	 	nil
	 	end
 end

end