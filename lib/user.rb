class User

	include DataMapper::Resource

	property :id, Serial
  property :email, String, unique: true

end