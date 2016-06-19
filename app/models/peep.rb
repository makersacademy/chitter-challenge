class Peep

	include DataMapper::Resource

	property :id, Serial
	property :post, String, length: 100
end
