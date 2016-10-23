class Message
	include DataMapper::Resource

	belongs_to :user

	property :id, Serial
	property :body, Text, required: true
	property :time_created, String, required: true

end