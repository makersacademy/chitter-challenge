# understands messages sent by users

class Peep

	include DataMapper::Resource

	belongs_to :user

	property :id, Serial

end