
class Peep

	include DataMapper::Resource

  belongs_to :user

	property :id, 		Serial
	property :title, 	String
	property :content, Text
  property :created_at, DateTime

end
