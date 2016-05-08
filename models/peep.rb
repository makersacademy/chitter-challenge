class Peep

	include DataMapper::Resource

	property :id, Serial
	property :content, String
	property :created_at, DateTime

	belongs_to :user, required: false

	def created_at_formatted
		created_at.strftime("%H:%M, %A %-d %b %Y")
	end

end