class Peep

	include DataMapper::Resource

	belongs_to :user, required: false

	property :id, Serial
	property :content, String, length:140
	property :created_at, DateTime

end