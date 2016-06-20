class Peep

	include DataMapper::Resource

	belongs_to :user

	property :id, Serial
	property :post, String, length: 100
	property :created_at, DateTime
end
