
class Message
	include DataMapper::Resource

	property :id, Serial
	property :text, Text
	property :date_time, DateTime

	belongs_to :user
end