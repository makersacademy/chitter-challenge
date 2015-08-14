require 'data_mapper'

class User

	include DataMapper::Resource

	property :id, Serial
	property :email, String, required: true
	property :username, String, required: true
	property :password, String                    # get ride of these two!
	property :password_confirmation, String       # get ride of these two!
	# property :password_digest, Text

	# validates_confirmation_of :password
	# validates_presence_of :password
	# validates_uniqueness_of :email

end

