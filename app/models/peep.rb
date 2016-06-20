class Peep

	include DataMapper::Resource

	has 1, :user, through: Resource

	property :id, Serial
	property :content, String, length:140
	property :timestamp, DateTime, required: true

end