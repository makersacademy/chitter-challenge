class User

	include DataMapper::Resource

	property :id, Serial
	property :name, String
	property :email, String
	property :password_digest, Text
  property :handle, String, length: 15

end
