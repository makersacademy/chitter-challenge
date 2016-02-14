
class Peep

	include DataMapper::Resource

	property :id, Serial
	property :peep, String, :length => 1..140, required: true


end